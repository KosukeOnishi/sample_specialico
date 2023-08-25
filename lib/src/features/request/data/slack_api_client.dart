import 'package:specialico/index.dart';
import 'package:http/http.dart' as http;

abstract class SlackApiClient {
  static final String oauthToken = dotenv.env['SLACK_OAUTH_TOKEN'] as String;
  static final String suggestChannelId =
      dotenv.env['SUGGEST_CHANNEL_ID'] as String;
  static final String reportChannelId =
      dotenv.env['REPORT_CHANNEL_ID'] as String;

  static Future<void> sendSuggest({
    required User user,
    required String mapUrl,
    required String shopName,
  }) async {
    final url = Uri.parse('https://slack.com/api/chat.postMessage');

    final text =
        'userId: ${user.userId}, userName: ${user.name}\n\n店名: $shopName\n$mapUrl';

    final req = http.MultipartRequest('POST', url)
      ..fields['channel'] = suggestChannelId
      ..fields['text'] = text;

    req.headers['Authorization'] = 'Bearer $oauthToken';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    final status = res.statusCode;
    if (status != 200) throw Exception('http.send error: statusCode= $status');
  }

  static Future<void> sendReport({
    required User user,
    required Shop shop,
    required Map<ShopReportType, bool> boolFlags,
    required String? reportDetail,
  }) async {
    final url = Uri.parse('https://slack.com/api/chat.postMessage');

    String boolFlagsString = '';
    final tempFlags = {...boolFlags}..removeWhere((key, value) => !value);
    for (ShopReportType reportType in tempFlags.keys) {
      boolFlagsString += '- ${reportType.text}\n';
    }
    String detailString = reportDetail != null ? '\nコメント: $reportDetail' : '';
    final text =
        'userId: ${user.userId}, userName: ${user.name}\n\n店名: ${shop.name}, shopId: ${shop.shopId}\n\n内容\n$boolFlagsString$detailString\n${shop.mapUrl}';

    final req = http.MultipartRequest('POST', url)
      ..fields['channel'] = reportChannelId
      ..fields['text'] = text;

    req.headers['Authorization'] = 'Bearer $oauthToken';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    final status = res.statusCode;
    if (status != 200) throw Exception('http.send error: statusCode= $status');
  }
}
