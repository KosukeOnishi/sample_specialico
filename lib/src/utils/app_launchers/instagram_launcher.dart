import 'dart:io';

import 'package:specialico/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class InstagramLauncher {
  static void launchUser(Shop shop) async {
    final urlString = shop.instagramAccountUrl!;
    RegExp regExp =
        RegExp(r'https:\/\/www\.instagram\.com\/([A-Za-z0-9-_]+)\/');
    Match match = regExp.firstMatch(urlString)!;
    String username = match.group(1)!;

    String instagramUserUrl = 'instagram://user?username=$username';

    if (Platform.isIOS) {
      // Instagramアプリがインストールされているかどうかを確認
      final bool iosAppInstalled = await canLaunchUrlString('instagram://');
      if (iosAppInstalled) {
        await launchUrl(Uri.parse(instagramUserUrl));
      } else {
        // アプリがインストールされていない場合、ブラウザで開く
        await launchUrlString(urlString);
      }
    } else {
      try {
        await launchUrl(Uri.parse(instagramUserUrl));
      } catch (e) {
        await launchUrlString(urlString);
      }
    }
  }

  static void launchPost(InstagramPost post) async {
    Uri uri = Uri.parse('instagram://media?id=${post.mediaId}');

    if (Platform.isIOS) {
      // Instagramアプリがインストールされているかどうかを確認
      final bool iosAppInstalled = await canLaunchUrlString('instagram://');
      if (iosAppInstalled) {
        await launchUrl(uri);
      } else {
        // アプリがインストールされていない場合、ブラウザで開く
        await launchUrlString(post.postUrl);
      }
    } else {
      await launchUrlString(post.postUrl);
    }
  }
}
