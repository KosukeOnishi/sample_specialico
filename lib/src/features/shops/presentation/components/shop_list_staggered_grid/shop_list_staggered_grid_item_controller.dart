import 'package:specialico/index.dart';

part 'shop_list_staggered_grid_item_controller.freezed.dart';
part 'shop_list_staggered_grid_item_controller.g.dart';

@freezed
class ShopListStaggeredGridItemState with _$ShopListStaggeredGridItemState {
  const factory ShopListStaggeredGridItemState() =
      _ShopListStaggeredGridItemState;
}

@riverpod
class ShopListStaggeredGridItemController
    extends _$ShopListStaggeredGridItemController {
  @override
  ShopListStaggeredGridItemState build() {
    return const ShopListStaggeredGridItemState();
  }

  void onTap(
    String shopId,
    ShopListCategory category,
    BuildContext context,
  ) {
    final isCurrentlyShowingListScreen = context
        .currentBeamLocation.state.routeInformation.location!
        .contains('list');
    final isCurrentlyShowingAreaList = context
        .currentBeamLocation.state.routeInformation.location!
        .contains('area');
    if (isCurrentlyShowingAreaList) {
      context.beamToNamed(
          '/home/area/list/detail?shopId=$shopId&category=${category.name}');
    } else if (isCurrentlyShowingListScreen) {
      context.beamToNamed(
          '/home/list/${category.name}/detail?shopId=$shopId&category=${category.name}');
    } else {
      context
          .beamToNamed('/home/detail?shopId=$shopId&category=${category.name}');
    }
  }

  String getSubInfoText(
    ShopListCategory category,
    Position? currentPosition,
    ShopSnippet snippet,
  ) {
    final subInfoText = () {
      if (category == ShopListCategory.recommend) {
        final shop = ref.read(shopOfShopIdProvider(snippet.shopId));
        final distanceText = DistanceCalculator.getDistanceText(
          currentPosition,
          snippet.position,
        );
        return '$distanceText${shop!.likedCount.toString()}いいね';
      } else if (category == ShopListCategory.area) {
        final shop = ref.read(shopOfShopIdProvider(snippet.shopId));
        return '${shop!.likedCount.toString()}いいね';
      } else if (category == ShopListCategory.latest) {
        final shop = ref.read(shopOfShopIdProvider(snippet.shopId));
        final datetimeGapText =
            DatetimeCalculator.getDatetimeGapText(snippet.createdAt);
        return '${Prefecture.fromAlphabet(shop!.subRegions[0]).name}  $datetimeGapText';
      } else {
        final shop = ref.read(shopOfShopIdProvider(snippet.shopId));
        return DatetimeCalculator.getDatetimeGapText(snippet.createdAt) +
            (shop != null
                ? '   ${Prefecture.fromAlphabet(shop.subRegions[0]).name}'
                : '');
      }
    }();
    return '    $subInfoText';
  }
}
