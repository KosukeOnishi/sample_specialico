import 'dart:io';

import 'package:specialico/index.dart';

abstract class AdmobUtil {
  static AdWithView getGridNativeAd({
    required BuildContext context,
    required void Function(Ad)? onAdLoaded,
    required dynamic Function(Ad, LoadAdError)? onAdFailedToLoad,
  }) {
    final String adUnitId = () {
      if (Platform.isAndroid) {
        return dotenv.env['GRID_AD_UNIT_ANDROID'] as String;
      } else {
        debugPrint(dotenv.env['GRID_AD_UNIT_IOS'] as String);
        return dotenv.env['GRID_AD_UNIT_IOS'] as String;
      }
    }();

    return NativeAd(
      adUnitId: adUnitId,
      listener: NativeAdListener(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: onAdFailedToLoad,
        onAdClicked: (ad) => AnalyticsClient().logEvent(
          LogEvent.adPressed,
          {'ad_type': 'grid', 'unit_id': ad.adUnitId},
        ),
        onAdImpression: (ad) => AnalyticsClient().logEvent(
          LogEvent.adImpression,
          {'ad_type': 'grid', 'unit_id': ad.adUnitId},
        ),
        onAdClosed: (ad) {},
        onAdOpened: (ad) {},
        onAdWillDismissScreen: (ad) {},
        onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
      ),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        cornerRadius: 16,
        mainBackgroundColor: Theme.of(context).colorScheme.background,
        secondaryTextStyle: NativeTemplateTextStyle(
          size: 12,
          textColor: Theme.of(context).colorScheme.onBackground,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(size: 12),
        primaryTextStyle: NativeTemplateTextStyle(
          size: 12,
          textColor: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  static AdWithView getBannerAd({
    required void Function(Ad)? onAdLoaded,
    required dynamic Function(Ad, LoadAdError)? onAdFailedToLoad,
  }) {
    final String adUnitId = () {
      if (Platform.isAndroid) {
        return dotenv.env['BANNER_AD_UNIT_ANDROID'] as String;
      } else {
        debugPrint(dotenv.env['BANNER_AD_UNIT_IOS'] as String);
        return dotenv.env['BANNER_AD_UNIT_IOS'] as String;
      }
    }();

    return BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdClicked: (ad) => AnalyticsClient().logEvent(
          LogEvent.adPressed,
          {'ad_type': 'banner', 'unit_id': ad.adUnitId},
        ),
        onAdImpression: (ad) => AnalyticsClient().logEvent(
          LogEvent.adImpression,
          {'ad_type': 'banner', 'unit_id': ad.adUnitId},
        ),
        // Called when an ad is successfully received.
        onAdLoaded: onAdLoaded,
        // Called when an ad request failed.
        onAdFailedToLoad: onAdFailedToLoad,
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
      ),
    );
  }
}
