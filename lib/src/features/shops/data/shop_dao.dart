import 'package:specialico/index.dart';

abstract class ShopDao {
  static Future<Map<String, dynamic>> getShopCount() async {
    debugPrint('\ngetShopCount called in shop DAO!\n');
    final snapshot = await FirebaseFirestore.instance
        .collection('shops')
        .doc('shop_count')
        .get();
    return snapshot.data()!;
  }

  static Future<List<Shop>> getRecommendedShops(Position position) async {
    debugPrint('\ngetRecommendedShops called in shop DAO!\n');

    // 位置情報をOFFにされていたら、東京駅を中心にする
    GeoFirePoint center =
        GeoFirePoint(GeoPoint(position.latitude, position.longitude));

    final collectionRef =
        FirebaseFirestore.instance.collection('shops/v1/shops_v1');

    // はじめに5km圏内でショップ情報を取得し、件数が4件以内だったら10km圏内でショップを表示する
    var snapshot =
        await GeoCollectionReference(collectionRef).fetchWithinWithDistance(
      center: center,
      radiusInKm: 5,
      field: 'position',
      geopointFrom: (obj) => obj['position']['geopoint'],
      strictMode: true,
    );
    if (snapshot.length < 4) {
      snapshot =
          await GeoCollectionReference(collectionRef).fetchWithinWithDistance(
        center: center,
        radiusInKm: 10,
        field: 'position',
        geopointFrom: (obj) => obj['position']['geopoint'],
        strictMode: true,
      );
    }
    return snapshot
        .map((doc) => Shop.fromJson(doc.documentSnapshot.data()!))
        .toList();
  }

  static Future<List<Shop>> getPopularShops() async {
    debugPrint('\ngetPopularShops called in shop DAO!\n');

    final snapshot = await FirebaseFirestore.instance
        .collection('shops/v1/shops_v1')
        .orderBy('likedCount', descending: true)
        .limit(10)
        .get();
    return snapshot.docs.map((e) => Shop.fromJson(e.data())).toList();
  }

  static Future<List<Shop>> getSpecificLocShops(
    Prefecture? prefecture,
    Iterable<Object?>? startAfter,
  ) async {
    debugPrint('\ngetSpecificLocShops called in shop DAO!');
    final collectionRef =
        FirebaseFirestore.instance.collection('shops/v1/shops_v1');
    final String? prefectureText = prefecture?.toString().split('.').last;
    String? queryString;
    if (prefectureText != null) {
      queryString = prefectureText[0].toUpperCase() +
          prefectureText.substring(1).toLowerCase();
    }
    final query = collectionRef.where('subRegions', arrayContains: queryString);

    final snapshots = await () async {
      if (startAfter == null) {
        return await query
            .orderBy('likedCount', descending: true)
            .orderBy('shopId')
            .limit(8)
            .get();
      } else {
        debugPrint('startAfter: ${startAfter.toList().toString()}');
        return await query
            .orderBy('likedCount', descending: true)
            .orderBy('shopId')
            .startAfter(startAfter)
            .limit(8)
            .get();
      }
    }();
    return snapshots.docs.map((doc) => Shop.fromJson(doc.data())).toList();
  }

  static Future<List<Shop>> getLatestShops(DateTime? startAfter) async {
    debugPrint('\ngetLatestShops called in shop DAO!\n');
    final snapshots = await () async {
      if (startAfter == null) {
        return await FirebaseFirestore.instance
            .collection('shops/v1/shops_v1')
            .orderBy('createdAt', descending: true)
            .limit(8)
            .get();
      } else {
        return await FirebaseFirestore.instance
            .collection('shops/v1/shops_v1')
            .orderBy('createdAt', descending: true)
            .startAfter([startAfter])
            .limit(8)
            .get();
      }
    }();
    return snapshots.docs.map((doc) => Shop.fromJson(doc.data())).toList();
  }

  static Future<List<LikedShopDocument>> getLikedShops(
    String userId,
    DateTime? startAfter,
  ) async {
    debugPrint('\ngetLikedShops called in shop DAO!\n');
    final snapshots = await () async {
      if (startAfter == null) {
        return await FirebaseFirestore.instance
            .collection('public/v1/public_liked_shops_v1')
            .where('userId', isEqualTo: userId)
            .orderBy('createdAt', descending: true)
            .limit(8)
            .get();
      } else {
        return await FirebaseFirestore.instance
            .collection('public/v1/public_liked_shops_v1')
            .where('userId', isEqualTo: userId)
            .orderBy('createdAt', descending: true)
            .startAfter([startAfter])
            .limit(8)
            .get();
      }
    }();
    return snapshots.docs.map((doc) {
      var docData = doc.data();
      docData['likedShopId'] = doc.id;
      return LikedShopDocument.fromJson(docData);
    }).toList();
  }

  static Future<Shop> getShop(String shopId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('shops/v1/shops_v1')
        .doc(shopId)
        .get();
    return Shop.fromJson(snapshot.data()!);
  }

  static Future<void> updateShop(Shop shop, User user) async {
    final weekdayTexts = shop.toJson()['weekdayTexts'];
    final weekdayTextsUpdatedBy = {
      'userId': user.userId,
      'userName': user.name
    };
    var data = {
      'updatedAt': FieldValue.serverTimestamp(),
      'weekdayTexts': weekdayTexts,
      'weekdayTextsUpdatedBy': weekdayTextsUpdatedBy,
      'weekdayTextsUpdatedAt': FieldValue.serverTimestamp(),
    };

    return FirebaseFirestore.instance
        .collection('shops/v1/shops_v1')
        .doc(shop.shopId)
        .update(data);
  }
}
