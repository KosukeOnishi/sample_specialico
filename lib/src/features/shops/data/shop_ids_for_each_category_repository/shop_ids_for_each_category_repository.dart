import 'package:specialico/index.dart';

part 'shop_ids_for_each_category_repository.g.dart';

@Riverpod(keepAlive: true)
class ShopIdsForEachCategoryRepository
    extends _$ShopIdsForEachCategoryRepository {
  @override
  Map<ShopListCategory, List<String>> build() {
    return <ShopListCategory, List<String>>{};
  }

  void setShopIds(ShopListCategory category, List<String> shopIds) {
    Map copy = {...state};
    copy[category] = shopIds;
    state = {...copy};
  }

  void addShopIds(ShopListCategory category, List<String> shopIds) {
    Map copy = {...state};
    List<String> currentShopIds = [...copy[category]];
    final addedShopIds =
        shopIds.where((id) => !currentShopIds.contains(id)).toList();
    copy[category] = [...currentShopIds, ...addedShopIds];
    state = {...copy};
  }

  void addShopId(ShopListCategory category, String shopId) {
    Map copy = {...state};
    if (copy[category] != null && copy[category] != []) {
      final List<String> currentShopIds = [...copy[category]];
      copy[category] = [...currentShopIds, shopId];
      state = {...copy};
    }
  }

  void removeShopId(ShopListCategory category, String shopId) {
    Map copy = {...state};
    if (copy[category] != null && copy[category] != []) {
      final List<String> newShopIds = [...copy[category]]
        ..removeWhere((element) => element == shopId);
      copy[category] = [...newShopIds];
      state = {...copy};
    }
  }

  void resetIds(ShopListCategory category) {
    Map copy = {...state};
    copy[category] = <String>[];
    state = {...copy};
  }
}

@Riverpod(keepAlive: true)
class ShopIdsForEachPrefectureRepository
    extends _$ShopIdsForEachPrefectureRepository {
  @override
  Map<Prefecture, List<String>> build() {
    return <Prefecture, List<String>>{};
  }

  void setShopIds(Prefecture prefecture, List<String> shopIds) {
    Map copy = {...state};
    copy[prefecture] = shopIds;
    state = {...copy};
  }

  void addShopIds(Prefecture prefecture, List<String> shopIds) {
    Map copy = {...state};
    List<String> currentShopIds = [...copy[prefecture]];
    final addedShopIds =
        shopIds.where((id) => !currentShopIds.contains(id)).toList();
    copy[prefecture] = [...currentShopIds, ...addedShopIds];
    state = {...copy};
  }
}
