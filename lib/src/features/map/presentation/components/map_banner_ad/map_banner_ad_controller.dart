import 'package:specialico/index.dart';

part 'map_banner_ad_controller.g.dart';
part 'map_banner_ad_controller.freezed.dart';

@freezed
class MapBannerAdState with _$MapBannerAdState {
  const factory MapBannerAdState({
    @Default(true) bool isLoading,
    AdWithView? ad,
  }) = _MapBannerAdState;
}

@riverpod
class MapBannerAdController extends _$MapBannerAdController {
  @override
  MapBannerAdState build(BuildContext context) {
    debugPrint('MapBannerAdController build');

    return MapBannerAdState(
      ad: AdmobUtil.getBannerAd(
        onAdLoaded: (ad) {
          state = state.copyWith(isLoading: false);
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      )..load(),
    );
  }
}
