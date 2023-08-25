import 'package:specialico/index.dart';

part 'home_screen_controller.freezed.dart';
part 'home_screen_controller.g.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState() = _HomeScreenState;
}

@Riverpod(keepAlive: true)
class HomeScreenController extends _$HomeScreenController {
  @override
  FutureOr<HomeScreenState> build() async {
    debugPrint('HomeScreenController build');
    // MapServiceとShopServiceの初期処理
    final position = await MapService.initCurrentPositionRepository(ref);
    // If the system can show an authorization request dialog
    final trackingStatus = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (trackingStatus == TrackingStatus.notDetermined) {
      TrackingStatus status = await AppTrackingTransparency.requestTrackingAuthorization();
      while (status == TrackingStatus.notDetermined) {
        status = await AppTrackingTransparency.requestTrackingAuthorization();
      }
    }
    ShopService.initShopRepository(ref);
    // ユーザーを取得する
    final userFuture = AuthService.initUserRepository(
      ref.read(userRepositoryProvider.notifier),
      ref.read(likedShopIdsRepositoryProvider.notifier),
    );
    // ショップの数を取得する
    final shopCountFuture = ShopService.getShopCount(
      ref.read(shopCountRepositoryProvider.notifier),
    );
    // ホーム画面に表示するようのrecommendedShopsを取得する （1回のみ呼ばれる）
    final recommendedShopsFuture = ShopService.getRecommendedShops(
      ref.read(shopRepositoryProvider.notifier),
      ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
      position,
    );
    await Future.wait([shopCountFuture, userFuture, recommendedShopsFuture]);
    return const HomeScreenState();
  }
}
