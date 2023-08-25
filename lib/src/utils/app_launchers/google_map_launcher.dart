import 'dart:io';

import 'package:specialico/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:url_launcher/url_launcher.dart' as url;

abstract class GoogleMapLauncher {
  static void launchUrl(Shop shop) async {
    String queryString = shop.name.split(" ").join("+");
    String googleMapsUrl =
        'comgooglemaps://?q=$queryString&center=${shop.position.latitude},${shop.position.longitude}';
    Uri uri = Uri.parse(googleMapsUrl);

    if (Platform.isIOS) {
      // iOSの場合、Googleマップアプリがインストールされているかどうかを確認
      final bool iosAppInstalled = await canLaunchUrlString('comgooglemaps://');
      if (iosAppInstalled) {
        await url.launchUrl(uri);
      } else {
        // Googleマップアプリがインストールされていない場合、ブラウザで開く
        await launchUrlString(shop.mapUrl);
      }
    } else {
      final intent = 'geo:${shop.position.latitude},${shop.position.longitude}?q=$queryString';
      final uri = Uri.parse(intent);
      await url.launchUrl(uri);
    }
  }
}
