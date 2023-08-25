import 'package:specialico/index.dart';

abstract class RequestDao {
  static Future<void> createSuggest({
    required User user,
    required String mapUrl,
    required String shopName,
  }) async {
    final docRef = FirebaseFirestore.instance
        .collection('requests/v1/shop_suggest_v1')
        .doc();
    var data = {
      'shopSuggestId': docRef.id,
      'createdAt': FieldValue.serverTimestamp(),
      'userId': user.userId,
      'userName': user.name,
      'mapUrl': mapUrl,
      'shopName': shopName,
      'isChecked': false,
      'isPassed': false,
    };

    await docRef.set(data);
  }

  static Future<void> createReport({
    required User user,
    required Shop shop,
    required Map<ShopReportType, bool> boolFlags,
    required String? reportDetail,
  }) async {
    final docRef = FirebaseFirestore.instance
        .collection('requests/v1/shop_report_v1')
        .doc();
    var contents = boolFlags.map<String, bool>(
      (key, value) => MapEntry(key.toString().split('.')[1], value),
    );
    contents['wrongBrand'] = false;
    var data = {
      'shopReportId': docRef.id,
      'createdAt': FieldValue.serverTimestamp(),
      'userId': user.userId,
      'userName': user.name,
      'shopId': shop.shopId,
      'shopName': shop.name,
      'contents': contents,
      'comment': reportDetail,
      'isChecked': false,
      'isPassed': false,
    };

    await docRef.set(data);
  }
}
