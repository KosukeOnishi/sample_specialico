import 'package:specialico/index.dart';

abstract class LikeDao {
  static Future<void> likeTransaction({
    required String userId,
    required ShopSnippet shopSnippet,
  }) async {
    final likedShopDocRef = FirebaseFirestore.instance
        .collection('public/v1/public_liked_shops_v1')
        .doc();
    final userDocRef = FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(userId);
    final shopDocRef = FirebaseFirestore.instance
        .collection('shops/v1/shops_v1')
        .doc(shopSnippet.shopId);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      // ドキュメントの読み取り
      final userDoc = await transaction.get(userDocRef);
      final user = User.fromJson(userDoc.data()!);
      final shopDoc = await transaction.get(shopDocRef);
      final shop = Shop.fromJson(shopDoc.data()!);

      // liked shopへの追加
      var newSnippetData = shopSnippet.toJson();
      newSnippetData['updatedAt'] = FieldValue.serverTimestamp();
      var data = {
        'createdAt': FieldValue.serverTimestamp(),
        'userId': userId,
        'shopId': shopSnippet.shopId,
        'shopSnippet': newSnippetData,
      };
      transaction.set(likedShopDocRef, data);

      // userのlikedShopsリストの更新
      final newLikedShopsList = [...user.likedShops];
      if (!newLikedShopsList.contains(shopSnippet.shopId)) {
        newLikedShopsList.add(shopSnippet.shopId);
      }
      transaction.update(
        userDocRef,
        {
          'likedShops': newLikedShopsList,
          'updatedAt': FieldValue.serverTimestamp(),
        },
      );

      // shopのlikedCountの更新
      final newLikedCount = shop.likedCount + 1;
      transaction.update(
        shopDocRef,
        {
          'likedCount': newLikedCount,
          'likedCountUpdatedAt': FieldValue.serverTimestamp(),
        },
      );
    });
  }

  static Future<void> unlikeTransaction({
    required String userId,
    required ShopSnippet shopSnippet,
  }) async {
    final likedShopDocQuery = FirebaseFirestore.instance
        .collection('public/v1/public_liked_shops_v1')
        .where('userId', isEqualTo: userId)
        .where('shopId', isEqualTo: shopSnippet.shopId)
        .limit(1);
    final querySnapshot = await likedShopDocQuery.get();
    DocumentReference? likedShopDocRef;
    if (querySnapshot.docs.isNotEmpty) {
      likedShopDocRef = querySnapshot.docs[0].reference;
    }
    final userDocRef = FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(userId);
    final shopDocRef = FirebaseFirestore.instance
        .collection('shops/v1/shops_v1')
        .doc(shopSnippet.shopId);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      // ドキュメントの読み取り
      final userDoc = await transaction.get(userDocRef);
      final user = User.fromJson(userDoc.data()!);
      final shopDoc = await transaction.get(shopDocRef);
      final shop = Shop.fromJson(shopDoc.data()!);

      // liked shopからの削除
      if (likedShopDocRef != null) {
        transaction.delete(likedShopDocRef);
      }

      // userのlikedShopsリストの更新
      final newLikedShopsList = [...user.likedShops];
      if (newLikedShopsList.contains(shopSnippet.shopId)) {
        newLikedShopsList
            .removeWhere((element) => element == shopSnippet.shopId);
      }
      transaction.update(
        userDocRef,
        {
          'likedShops': newLikedShopsList,
          'updatedAt': FieldValue.serverTimestamp(),
        },
      );

      // shopのlikedCountの更新
      final newLikedCount = shop.likedCount - 1;
      transaction.update(
        shopDocRef,
        {
          'likedCount': newLikedCount,
          'likedCountUpdatedAt': FieldValue.serverTimestamp(),
        },
      );
    });
  }

  static Future<void> updateLikedShopDoc(String likedShopId, Shop shop) async {
    var data = {
      'updatedAt': FieldValue.serverTimestamp(),
      'shopSnippet': shop.getShopSnippet().toJson(),
    };
    await FirebaseFirestore.instance
        .collection('public/v1/public_liked_shops_v1')
        .doc(likedShopId)
        .update(data);
  }
}
