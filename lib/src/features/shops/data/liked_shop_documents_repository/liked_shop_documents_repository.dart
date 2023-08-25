import 'package:specialico/index.dart';

part 'liked_shop_documents_repository.g.dart';

@Riverpod(keepAlive: true)
class LikedShopDocumentsRepository extends _$LikedShopDocumentsRepository {
  @override
  List<LikedShopDocument> build() {
    debugPrint('liked shop documents repository build');
    return <LikedShopDocument>[];
  }

  void addDocuments(List<LikedShopDocument> docs) {
    final idList = state.map((e) => e.likedShopId);
    final newDocs = docs.where((e) => !idList.contains(e.likedShopId)).toList();
    state = [...state, ...newDocs];
    _checkDocuments(newDocs);
  }

  DateTime getDocCreatedAtFromShopId(String shopId) {
    final doc = state.firstWhere((element) => element.shopId == shopId);
    return doc.createdAt;
  }

  void like(ShopSnippet snippet, String userId) {
    final newDoc = LikedShopDocument.fromJson({
      'likedShopId': '',
      'createdAt': Timestamp.now(),
      'updatedAt': null,
      'shopId': snippet.shopId,
      'userId': userId,
      'shopSnippet': snippet.toJson(),
    });
    state = [...state, newDoc];
  }

  void unlike(ShopSnippet snippet, String userId) {
    var copy = [...state];
    copy.removeWhere((e) => e.shopId == snippet.shopId);
    state = copy;
  }

  void checkShops(List<Shop> shops) {
    for (Shop shop in shops) {
      final currentShopIds = state.map((e) => e.shopId).toList();
      // 該当するliked shop documentが存在するか確認
      final hasLikedShopDoc = currentShopIds.contains(shop.shopId);
      // データがなければ次のshopのチェックに進む
      if (!hasLikedShopDoc) continue;

      final matchedDoc = state.firstWhere((e) => e.shopId == shop.shopId);
      final lastlyUpdatedAt = matchedDoc.updatedAt ?? matchedDoc.createdAt;
      // 更新の必要があった場合
      if (lastlyUpdatedAt
          .isBefore(shop.updatedAt ?? shop.createdAt)) {
        LikeDao.updateLikedShopDoc(matchedDoc.likedShopId, shop);
        final newDoc = matchedDoc.copyWith(
          updatedAt: DateTime.now(),
          shopSnippet: shop.getShopSnippet(),
        );
        final index = state.indexWhere((element) => element == matchedDoc);
        var temp = [...state];
        temp[index] = newDoc;
        state = temp;
      }
    }
  }

  // liked shop documentsが更新の必要があるか確認する
  void _checkDocuments(List<LikedShopDocument> docs) {
    final currentShops = ref.read(shopRepositoryProvider);
    final currentShopIds = currentShops.map((e) => e.shopId);
    // shop repositoryにデータがあるか確認
    for (LikedShopDocument doc in docs) {
      final hasAlreadyShopData = currentShopIds.contains(doc.shopId);
      // データがなければ次のドキュメントのチェックに進む
      if (!hasAlreadyShopData) continue;

      final matchedShop =
          currentShops.firstWhere((shop) => shop.shopId == doc.shopId);
      final lastlyUpdatedAt = doc.updatedAt ?? doc.createdAt;
      // 更新の必要があった場合
      if (lastlyUpdatedAt
          .isBefore(matchedShop.updatedAt ?? matchedShop.createdAt)) {
        LikeDao.updateLikedShopDoc(doc.likedShopId, matchedShop);
        final newDoc = doc.copyWith(
          updatedAt: DateTime.now(),
          shopSnippet: matchedShop.getShopSnippet(),
        );
        final index = state.indexWhere((element) => element == doc);
        var temp = [...state];
        temp[index] = newDoc;
        state = temp;
      }
    }
  }
}
