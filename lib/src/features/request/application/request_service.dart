import 'package:specialico/index.dart';

abstract class RequestService {
  static Future<void> sendRequest({
    required User user,
    required String mapUrl,
    required String shopName,
  }) async {
    SlackApiClient.sendSuggest(user: user, mapUrl: mapUrl, shopName: shopName);
    return RequestDao.createSuggest(
      user: user,
      mapUrl: mapUrl,
      shopName: shopName,
    );
  }

  static Future<void> sendReport({
    required User user,
    required Shop shop,
    required Map<ShopReportType, bool> boolFlags,
    required String? reportDetail,
  }) async {
    SlackApiClient.sendReport(
      user: user,
      shop: shop,
      boolFlags: boolFlags,
      reportDetail: reportDetail,
    );
    return RequestDao.createReport(
      user: user,
      shop: shop,
      boolFlags: boolFlags,
      reportDetail: reportDetail,
    );
  }
}
