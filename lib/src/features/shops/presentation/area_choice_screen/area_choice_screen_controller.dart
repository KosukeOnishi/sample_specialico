import 'package:specialico/index.dart';

part 'area_choice_screen_controller.freezed.dart';
part 'area_choice_screen_controller.g.dart';

@freezed
class AreaChoiceScreenState with _$AreaChoiceScreenState {
  const factory AreaChoiceScreenState() = _AreaChoiceScreenState;
}

@riverpod
class AreaChoiceScreenController extends _$AreaChoiceScreenController {
  @override
  FutureOr<AreaChoiceScreenState> build() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return const AreaChoiceScreenState();
  }

  Map<Region, List<Prefecture>> getLocationData() {
    const prefectures = Prefecture.values;
    Map<Region, List<Prefecture>> locationData = {};
    for (Region region in Region.values) {
      locationData[region] = prefectures
          .where((prefecture) => prefecture.region == region)
          .toList();
    }
    return locationData;
  }

  void onPressedNationwide(BuildContext context) {
    // areaカテゴリにセットされているidをリセット
    ref
        .read(shopIdsForEachCategoryRepositoryProvider.notifier)
        .resetIds(ShopListCategory.area);
    context.beamToNamed('/home/area/list');
  }

  void onPressedPrefecture(BuildContext context, Prefecture prefecture) {
    // areaカテゴリにセットされているidをリセット
    ref
        .read(shopIdsForEachCategoryRepositoryProvider.notifier)
        .resetIds(ShopListCategory.area);
    // areaカテゴリに新たにidをセットする
    final List<String>? ids =
        ref.read(shopIdsForEachPrefectureRepositoryProvider)[prefecture];
    if (ids?.isNotEmpty ?? false) {
      ref.read(shopIdsForEachCategoryRepositoryProvider.notifier).setShopIds(
            ShopListCategory.area,
            ids!,
          );
    }
    context.beamToNamed(
      '/home/area/list?location=${prefecture.toString().split('.').last}',
    );
  }
}
