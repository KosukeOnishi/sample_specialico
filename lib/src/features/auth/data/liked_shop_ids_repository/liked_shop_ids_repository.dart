import 'package:specialico/index.dart';

part 'liked_shop_ids_repository.g.dart';

@Riverpod(keepAlive: true)
class LikedShopIdsRepository extends _$LikedShopIdsRepository {
  @override
  List<String> build() {
    debugPrint('liked shop ids repository build');
    return [];
  }

  void setIds(List<String> ids) {
    state = ids;
  }

  Future<void> like({required String userId, required ShopSnippet shopSnippet}) async {
    if (!state.contains(shopSnippet.shopId)) {
      state = [...state, shopSnippet.shopId];
      return LikeDao.likeTransaction(userId: userId, shopSnippet: shopSnippet);
    }
  }

  Future<void> unlike({required String userId, required ShopSnippet shopSnippet}) async {
    if (state.contains(shopSnippet.shopId)) {
      state = [...state.where((element) => element != shopSnippet.shopId)];
      return LikeDao.unlikeTransaction(userId: userId, shopSnippet: shopSnippet);
    }
  }
}
