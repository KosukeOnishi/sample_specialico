import 'package:specialico/index.dart';

part 'native_ad_item_controller.g.dart';
part 'native_ad_item_controller.freezed.dart';

@freezed
class NativeAdItemState with _$NativeAdItemState {
  const factory NativeAdItemState({
    @Default(true) bool isLoading,
    AdWithView? ad,
  }) = _NativeAdItemState;
}

@riverpod
class NativeAdItemController extends _$NativeAdItemController {
  @override
  NativeAdItemState build(AdWithView? adView, int index, BuildContext context) {
    debugPrint('NativeAdItemController build');

    return NativeAdItemState(
      isLoading: adView != null ? false : true,
      ad: adView ??
          AdmobUtil.getGridNativeAd(
            context: context,
            onAdLoaded: (ad) {
              // ignore: avoid_print
              print('$NativeAd loaded.');
              state = state.copyWith(isLoading: false);
            },
            onAdFailedToLoad: (ad, error) {
              // ignore: avoid_print
              print('$NativeAd failedToLoad: $error');
              ad.dispose();
              state = state.copyWith(isLoading: false, ad: null);
            },
          )
        ..load(),
    );
  }
}
