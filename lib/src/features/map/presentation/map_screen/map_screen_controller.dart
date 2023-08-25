import 'dart:async';
import 'dart:ui' as ui;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;
import 'package:specialico/index.dart';

part 'map_screen_controller.freezed.dart';
part 'map_screen_controller.g.dart';

@freezed
class MapScreenState with _$MapScreenState {
  const factory MapScreenState({
    required int screenActiveCount,
    required bool isLoading,
    required bool shouldShowSnippetDetail,
    required Set<Marker> markers,
    MarkerId? focusedMarkerId,
    @Default({}) Map<String, BitmapDescriptor> bitmaps,
    @Default({}) Map<MarkerId, Place> currentPlaces,
    @Default([]) List<Place> focusedPlaces,
    @Default(14) double focusedZoomLevel,
    AnimationController? focusAnimationController,
    PageController? pageController,
    Completer<GoogleMapController>? completer,
  }) = _MapScreenState;
}

@Riverpod(keepAlive: true)
class MapScreenController extends _$MapScreenController {
  ui.Image? favImage;
  late List<String> likedShopIds;

  @override
  MapScreenState build() {
    debugPrint('MapScreenController build');
    MapService.getMarkerSnippets(ref.read(placesRepositoryProvider.notifier))
        .then((_) {
      state = state.copyWith(isLoading: false);
    });
    return MapScreenState(
      screenActiveCount: 0,
      isLoading: true,
      shouldShowSnippetDetail: true,
      markers: Set.of({}),
    );
  }

  /// ClusterManagerの初期化
  ClusterManager initClusterManager() {
    likedShopIds = [...ref.read(likedShopIdsRepositoryProvider)];
    return ClusterManager(
      ref.read(placesRepositoryProvider), // cluster item
      // update func
      (markers) {
        final isFocusedMarkerActive = markers
            .where((element) => element.markerId == state.focusedMarkerId)
            .isNotEmpty;
        // focusされているマーカーがあった場合、通常のカスタムマーカーと追加のデフォルトマーカーをセットする
        if (isFocusedMarkerActive) {
          final focusedMarker = markers
              .where((element) => element.markerId == state.focusedMarkerId)
              .first;
          final additionalMarker = Marker(
            markerId: MarkerId(focusedMarker.hashCode.toString()),
            position: focusedMarker.position,
            zIndex: 1.0,
          );
          state =
              state.copyWith(markers: <Marker>{...markers, additionalMarker});
        }
        // focusが解除されたとき、アニメショーンで下部のリストをしまう
        else if (state.focusedMarkerId != null) {
          state.focusAnimationController!.reverse();
          Future.delayed(const Duration(milliseconds: 200)).then((_) =>
              state = state.copyWith(markers: markers, focusedMarkerId: null));
        }
        // その他のケースは通常のカスタムマーカーのみをセット
        else {
          state = state.copyWith(markers: markers, focusedMarkerId: null);
        }
      },
      // default: [1, 4.25, 6.75, 8.25, 11.5, 14.5, 16.0, 16.5, 20.0],
      levels: const [2, 4.5, 6.75, 9.5, 11, 11.6, 12, 13],
      extraPercent: 1.0,
      markerBuilder: _markerBuilder,
    );
  }

  void registerControllers(
    AnimationController controller,
    PageController pageController,
    Completer<GoogleMapController> mapControllerCompleter,
  ) {
    state = state.copyWith(
      focusAnimationController: controller,
      pageController: pageController,
      completer: mapControllerCompleter,
    );
  }

  // マーカーの生成関数
  Future<Marker> Function(Cluster<ClusterItem>) get _markerBuilder {
    return (cluster) async {
      final name = (cluster.items.first as Place).name;
      MarkerId markerId = MarkerId(cluster.getId());
      if (!cluster.isMultiple) {
        markerId = MarkerId((cluster.items.first as Place).shopId);
        var currentPlacesCopy = {...state.currentPlaces};
        currentPlacesCopy[markerId] = cluster.items.first as Place;
        state = state.copyWith(currentPlaces: currentPlacesCopy);
      }

      return Marker(
        markerId: markerId,
        position: cluster.location,
        onTap: () async {
          HapticFeedback.mediumImpact();
          // クラスターでないマーカーのtap時
          if (!cluster.isMultiple) {
            final previous = state.focusedMarkerId;
            final wasNotFocused = previous == null;
            state = state.copyWith(focusedMarkerId: markerId);

            final place = cluster.items.first as Place;
            final point = GeoFirePoint(
                GeoPoint(place.latLng.latitude, place.latLng.longitude));
            // focusがない状態でtapされたとき
            if (wasNotFocused) {
              await Future.delayed(const Duration(milliseconds: 400));
              var currentPlaces = state.currentPlaces.values.toList();
              final distances = currentPlaces
                  .map((e) => point.distanceBetweenInKm(
                      geopoint:
                          GeoPoint(e.latLng.latitude, e.latLng.longitude)))
                  .toList();
              var sortedDistances = [...distances];
              sortedDistances.sort((a, b) => a.compareTo(b));
              final indicesList =
                  distances.map((e) => sortedDistances.indexOf(e)).toList();
              List<Place> focusedPlaces = List.generate(
                  indicesList.length, (index) => currentPlaces[index]);
              for (int i = 0; i < indicesList.length; i++) {
                focusedPlaces[indicesList[i]] = currentPlaces[i];
              }
              final zoomLevel =
                  await (await state.completer!.future).getZoomLevel();
              state = state.copyWith(
                focusedPlaces: focusedPlaces.take(10).toList(),
                focusedZoomLevel: zoomLevel,
              );
              state.pageController!.jumpToPage(0);
              state.focusAnimationController!.forward();
            }
            // 同じplaceに再度focusするとき
            else if (previous == markerId) {
              state.pageController!.jumpToPage(0);
              state.focusAnimationController!.forward();
            }
            // すでにfocusがある状態で他のplaceがtapされたとき
            else if (previous != markerId) {
              state.focusAnimationController!.reverse();
              await Future.delayed(const Duration(milliseconds: 400));
              var currentPlaces = state.currentPlaces.values.toList();
              final distances = currentPlaces
                  .map((e) => point.distanceBetweenInKm(
                      geopoint:
                          GeoPoint(e.latLng.latitude, e.latLng.longitude)))
                  .toList();
              var sortedDistances = [...distances];
              sortedDistances.sort((a, b) => a.compareTo(b));
              final indicesList = distances
                  .map((e) => sortedDistances.indexOf(e))
                  .toSet()
                  .toList();
              debugPrint(distances.toString());
              debugPrint(sortedDistances.toString());
              debugPrint(indicesList.toString());
              List<Place> focusedPlaces = List.generate(
                  indicesList.length, (index) => currentPlaces[index]);
              for (int i = 0; i < indicesList.length; i++) {
                focusedPlaces[indicesList[i]] = currentPlaces[i];
              }
              state = state.copyWith(
                  focusedPlaces: focusedPlaces.take(10).toList());
              state.pageController!.jumpToPage(0);
              state.focusAnimationController!.forward();
            }
            Map<String, Object?> params = {
              'shop_id': markerId.value,
              'longitude': cluster.location.longitude,
              'latitude': cluster.location.latitude,
            };
            final position = ref.read(currentPositionRepositoryProvider);
            if (position != null) {
              params['distance_in_km'] =
                  DistanceCalculator.calculateDistanceOfPositionAndGeopoint(
                      position, point.geopoint);
            }
            AnalyticsClient().logEvent(LogEvent.pressedMarker, params);
          }
          // clusterのtap時
          else {
            final controller = await state.completer!.future;
            final currentZoomLevel = await controller.getZoomLevel();
            if (currentZoomLevel < 7) {
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: cluster.location,
                  zoom: 8,
                ),
              ));
            } else if (currentZoomLevel < 9.0) {
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: cluster.location,
                  zoom: 10,
                ),
              ));
            } else if (currentZoomLevel < 11.1) {
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: cluster.location,
                  zoom: 11.5,
                ),
              ));
            } else if (currentZoomLevel < 13) {
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: cluster.location,
                  zoom: 13.2,
                ),
              ));
            }
            Map<String, Object?> params = {
              'cluster_id': markerId.value,
              'cluster_count': cluster.count,
              'longitude': cluster.location.longitude,
              'latitude': cluster.location.latitude,
            };
            final position = ref.read(currentPositionRepositoryProvider);
            if (position != null) {
              params['distance_in_km'] =
                  DistanceCalculator.calculateDistanceOfPositionAndGeopoint(
                      position,
                      GeoPoint(cluster.location.latitude,
                          cluster.location.longitude));
            }
            AnalyticsClient().logEvent(LogEvent.pressedCluster, params);
          }
        },
        anchor: (!cluster.isMultiple && state.shouldShowSnippetDetail)
            ? Offset(
                name.length > 19
                    ? 0.055
                    : name.length > 10
                        ? 0.06
                        : 0.08,
                0.5,
              )
            : const Offset(0.5, 0.5),
        icon: await _getMarker(cluster),
      );
    };
  }

  Future<BitmapDescriptor> _getMarker(Cluster<ClusterItem> cluster) async {
    final isCluster = cluster.isMultiple;
    final shouldShowDetail = !isCluster && state.shouldShowSnippetDetail;
    bool shouldUpdateBitmap = false;
    final isLiked = () {
      if (cluster.isMultiple) return false;
      final shopId = (cluster.items.first as Place).shopId;
      final isPreviouslyLiked = likedShopIds.contains(shopId);
      final isCurrentlyLiked = ref.read(isLikedProvider(shopId));
      shouldUpdateBitmap = isPreviouslyLiked != isCurrentlyLiked;
      if (!isPreviouslyLiked && isCurrentlyLiked) {
        likedShopIds.add(shopId);
      } else if (isPreviouslyLiked && !isCurrentlyLiked) {
        likedShopIds.removeWhere((element) => element == shopId);
      }
      return isCurrentlyLiked;
    }();

    // すでに画像を作っていれば、キャッシュした画像をreturnする
    if (isCluster) {
      final BitmapDescriptor? cache = state.bitmaps[cluster.count.toString()];
      if (cache != null) return cache;
    } else if (shouldShowDetail && !shouldUpdateBitmap) {
      final BitmapDescriptor? cache =
          state.bitmaps[(cluster.items.first as Place).name];
      if (cache != null) return cache;
    } else {
      final BitmapDescriptor? cache =
          isLiked ? state.bitmaps['liked'] : state.bitmaps['default'];
      if (cache != null) return cache;
    }

    // cacheがない場合は、画像を作ってcacheに追加
    final newBitmap = await MarkerBitmapUtil.getMarkerBitmap(
      cluster.isMultiple ? 100 : 60,
      isLiked: isLiked,
      text: cluster.isMultiple ? cluster.count.toString() : null,
      name: (!cluster.isMultiple && state.shouldShowSnippetDetail)
          ? (cluster.items.first as Place).name
          : null,
      favImage: favImage,
    );
    if (isCluster) {
      var bitmapsCopy = {...state.bitmaps};
      bitmapsCopy[cluster.count.toString()] = newBitmap;
      state = state.copyWith(bitmaps: bitmapsCopy);
    } else if (shouldShowDetail) {
      var bitmapsCopy = {...state.bitmaps};
      bitmapsCopy[(cluster.items.first as Place).name] = newBitmap;
      state = state.copyWith(bitmaps: bitmapsCopy);
    } else {
      var bitmapsCopy = {...state.bitmaps};
      isLiked
          ? bitmapsCopy['liked'] = newBitmap
          : bitmapsCopy['default'] = newBitmap;
      state = state.copyWith(bitmaps: bitmapsCopy);
    }
    return newBitmap;
  }

  void onPageChanged(
    int index,
    ClusterManager manager,
    GoogleMapController mapController,
  ) {
    final focusedPlace = state.focusedPlaces[index];
    final focusedMarker = state.markers
        .where((element) => element.markerId == MarkerId(focusedPlace.shopId))
        .toList();
    if (focusedMarker.isNotEmpty) {
      debugPrint(focusedPlace.name);
      state = state.copyWith(
        focusedMarkerId: focusedMarker.first.markerId,
      );
      manager.updateMap();
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: focusedPlace.latLng, zoom: state.focusedZoomLevel),
      ));
    }
  }

  CameraPosition getInitialPosition() {
    final position = ref.read(currentPositionRepositoryProvider);
    if (position != null) {
      return CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 13,
      );
    } else {
      return const CameraPosition(
        target: LatLng(35.681236, 139.767125),
        zoom: 13,
      );
    }
  }

  Future<void> onCameraIdle(GoogleMapController controller) async {
    final zoomLevel = await controller.getZoomLevel();
    final shouldShowSnippetDetail = zoomLevel >= 13.0;
    state = state.copyWith(
      shouldShowSnippetDetail: shouldShowSnippetDetail,
      currentPlaces: Map.of({}),
    );
  }

  void onTapMap(ClusterManager manager) {
    final wasFocused = state.focusedMarkerId != null;
    state = state.copyWith(focusedMarkerId: null);
    manager.updateMap();
    if (wasFocused) state.focusAnimationController!.reverse();
  }

  void onSwipeDown(ClusterManager manager) {
    onTapMap(manager);
  }

  void onTapPageItem(
    BuildContext context,
    Place place,
    List<Place> focusedPlaces,
  ) {
    ref
        .read(shopIdsForEachCategoryRepositoryProvider.notifier)
        .setShopIds(ShopListCategory.map, [place.shopId]);
    modal.showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      elevation: 0,
      expand: true,
      bounce: true,
      duration: const Duration(milliseconds: 300),
      builder: (context) =>
          ShopDetailSheet(category: ShopListCategory.map, shopId: place.shopId),
    );
  }

  void addActiveCount() {
    int currentCount = state.screenActiveCount;
    state = state.copyWith(screenActiveCount: currentCount + 1);
  }

  void onTapFAB(
    Completer<GoogleMapController> controller,
    Position? position,
  ) async {
    final mapController = await controller.future;
    AnalyticsClient().logEvent(LogEvent.pressedFab, {});
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position != null
              ? LatLng(position.latitude, position.longitude)
              : const LatLng(35.681236, 139.767125),
          zoom: 13,
        ),
      ),
    );
  }
}

@riverpod
bool shouldShowMap(ShouldShowMapRef ref) {
  final count = ref.watch(mapScreenControllerProvider).screenActiveCount;
  final isLoading = ref.watch(mapScreenControllerProvider).isLoading;
  return count > 0 && !isLoading;
}

@riverpod
Set<Marker> currentMarker(CurrentMarkerRef ref) {
  return ref.watch(mapScreenControllerProvider).markers;
}

@riverpod
Map<MarkerId, Place> currentPlaces(CurrentPlacesRef ref) {
  return ref.watch(mapScreenControllerProvider).currentPlaces;
}

@riverpod
bool shouldShowPages(ShouldShowPagesRef ref) {
  return ref.watch(mapScreenControllerProvider).focusedMarkerId != null;
}
