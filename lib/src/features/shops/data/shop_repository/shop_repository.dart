import 'package:specialico/index.dart';

part 'shop_repository.g.dart';

@Riverpod(keepAlive: true)
class ShopRepository extends _$ShopRepository {
  @override
  List<Shop> build() {
    debugPrint('shop repository build');
    return <Shop>[];
  }

  void addShopToRepo(Shop shop) {
    state = [...state, shop];
  }

  void addShopsToRepo(List<Shop> shops) {
    if (shops.isEmpty) return;
    state = [...state, ...shops];
  }

  void checkAndAddShopToRepo(Shop shop) {
    final currentShopIds = state.map((e) => e.shopId);
    if (!currentShopIds.contains(shop.shopId)) addShopToRepo(shop);
  }

  void checkAndAddShopsToRepo(List<Shop> shops) {
    final currentShopIds = state.map((e) => e.shopId);
    final newShops =
        shops.where((shop) => !currentShopIds.contains(shop.shopId)).toList();
    addShopsToRepo(newShops);
  }

  Future<List<String>> getRecommendedShops(Position? position) async {
    final List<Shop> shops = await () async {
      if (position != null) {
        return ShopDao.getRecommendedShops(position);
      } else {
        return ShopDao.getPopularShops();
      }
    }();
    addShopsToRepo(shops);
    return shops.map((shop) => shop.shopId).toList();
  }

  Future<List<String>> getLatestShopsFrom(DateTime? startAfter) async {
    final List<Shop> shops = await ShopDao.getLatestShops(startAfter);
    checkAndAddShopsToRepo(shops);
    return shops.map((shop) => shop.shopId).toList();
  }

  Future<List<String>> getSpecificLocShopsFrom(
    Prefecture? prefecture,
    String? shopId,
  ) async {
    Iterable<Object?>? startAfter;
    if (shopId != null) {
      startAfter = [
        state.firstWhere((e) => e.shopId == shopId).likedCount,
        shopId,
      ];
    }
    final List<Shop> shops =
        await ShopDao.getSpecificLocShops(prefecture, startAfter);
    debugPrint('\nfetched shops: ${shops.map((e) => e.name).toList().join(', ')}\n');
    checkAndAddShopsToRepo(shops);
    return shops.map((shop) => shop.shopId).toList();
  }

  Future<List<ShopSnippet>> getLikedShopsFrom(
      String userId, DateTime? startAfter) async {
    final likedShopDocuments = await ShopDao.getLikedShops(userId, startAfter);
    ref
        .read(likedShopDocumentsRepositoryProvider.notifier)
        .addDocuments(likedShopDocuments);
    debugPrint('\nfetched shops: ${likedShopDocuments.map((e) => e.shopSnippet.name).toList().join(', ')}\n');
    return likedShopDocuments.map((e) => e.shopSnippet).toList();
  }

  Future<Shop> getShop(String shopId) async {
    final Shop shop = await ShopDao.getShop(shopId);
    checkAndAddShopToRepo(shop);
    return shop;
  }

  void updateLikedCount(int val, String shopId) {
    final Shop? shop = () {
      final temp = state.where((element) => element.shopId == shopId);
      return temp.isNotEmpty ? temp.first : null;
    }();
    if (shop == null) return;
    final newShop = shop.copyWith(likedCount: shop.likedCount + val);
    final newShops = [...state];
    final index = state.indexWhere((element) => element.shopId == shopId);
    newShops[index] = newShop;
    state = newShops;
  }

  Future<void> updateShop(Shop newShop, User user) async {
    final index = state.indexWhere((shop) => shop.shopId == newShop.shopId);
    var temp = [...state];
    temp[index] = newShop;
    state = temp;
    return ShopDao.updateShop(newShop, user);
  }
}
