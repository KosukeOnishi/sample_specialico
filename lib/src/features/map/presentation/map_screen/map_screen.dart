import 'dart:async';
import 'package:specialico/index.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(mapScreenControllerProvider);
    final shouldShowMap = ref.watch(shouldShowMapProvider);

    // APIアクセス節約のため、マップタブが選択されたときだけGoogle Mapを表示する
    if (shouldShowMap) {
      return const MapWidget();
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({super.key});

  @override
  ConsumerState<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final _translateTween = Tween<double>(begin: 200, end: 0);
  final _translateDuration = const Duration(milliseconds: 200);

  late ClusterManager _manager;
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _manager =
        ref.read(mapScreenControllerProvider.notifier).initClusterManager();
    _pageController = PageController(viewportFraction: 0.9);
    _animationController = AnimationController(
      vsync: this,
      duration: _translateDuration,
    );
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      ref.read(mapScreenControllerProvider.notifier).registerControllers(
          _animationController, _pageController, _controller);
    });
    _animation = _translateTween.animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentMarkers = ref.watch(currentMarkerProvider);
    final focusedPlaces = ref.watch(
        mapScreenControllerProvider.select((state) => state.focusedPlaces));
    final currentPosition = ref.watch(currentPositionRepositoryProvider);

    return Stack(
      children: [
        Scaffold(
          body: GoogleMap(
            mapType: MapType.normal,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: ref
                .read(mapScreenControllerProvider.notifier)
                .getInitialPosition(),
            compassEnabled: false,
            tiltGesturesEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onCameraMove: (position) async {
              _manager.onCameraMove(position);
            },
            onCameraIdle: () async {
              final ctrl = await _controller.future;
              await ref
                  .read(mapScreenControllerProvider.notifier)
                  .onCameraIdle(ctrl);
              _manager.updateMap();
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _manager.setMapId(controller.mapId);
            },
            onTap: (_) {
              ref.read(mapScreenControllerProvider.notifier).onTapMap(_manager);
            },
            markers: currentMarkers,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => ref
                .read(mapScreenControllerProvider.notifier)
                .onTapFAB(_controller, currentPosition),
            splashColor: Colors.transparent,
            child: const Icon(Icons.near_me),
          ),
        ),
        // 上部のバナー広告
        const Positioned(
          top: 0,
          child: MapBannerAd(),
        ),
        // 下からスライドで表示されるスニペット詳細の横ページビュー
        Positioned(
          bottom: 0,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy >= 12) {
                      ref
                          .read(mapScreenControllerProvider.notifier)
                          .onSwipeDown(_manager);
                    }
                    if (details.delta.dy <= -12) {
                      ref
                          .read(mapScreenControllerProvider.notifier)
                          .onTapPageItem(
                            context,
                            focusedPlaces[_pageController.page!.round()],
                            focusedPlaces,
                          );
                    }
                  },
                  child: SizedBox(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) async {
                        final mapController = await _controller.future;
                        ref
                            .read(mapScreenControllerProvider.notifier)
                            .onPageChanged(value, _manager, mapController);
                      },
                      itemCount:
                          focusedPlaces.isEmpty ? 1 : focusedPlaces.length,
                      itemBuilder: (context, index) {
                        if (focusedPlaces.isEmpty) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8.0),
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: const Text(''),
                          );
                        }
                        final place = focusedPlaces[index];
                        return InkWell(
                          onTap: () => ref
                              .read(mapScreenControllerProvider.notifier)
                              .onTapPageItem(context, place, focusedPlaces),
                          child: SnippetPageItem(place: place),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
