import 'package:specialico/index.dart';

part 'shop_detail_page_controller.freezed.dart';
part 'shop_detail_page_controller.g.dart';

@freezed
class ShopDetailPageState with _$ShopDetailPageState {
  const factory ShopDetailPageState({
    required double currentPhotoPosition,
    required PreloadPageController pageController,
  }) = _ShopDetailPageState;
}

@Riverpod(keepAlive: true)
class ShopDetailPageController extends _$ShopDetailPageController {
  @override
  ShopDetailPageState build(String shopId, ShopListCategory category) {
    final controller = PreloadPageController(initialPage: 0);
    final Shop? shop = ref.read(shopOfShopIdProvider(shopId));
    final shouldFetchShop = shop == null;
    if (shouldFetchShop) {
      ShopService.getShop(
        shopId: shopId,
        shopRepo: ref.read(shopRepositoryProvider.notifier),
      );
    }

    AnalyticsClient().logEvent(LogEvent.displayShopDetail, {
      'shop_id': shopId,
      'category': category.name,
      'is_liked_by_user':
          ref.read(likedShopIdsRepositoryProvider).contains(shopId),
    });

    return ShopDetailPageState(
      currentPhotoPosition: 0,
      pageController: controller,
    );
  }

  void onPageChanged(int index) {
    state = state.copyWith(
      currentPhotoPosition: index.toDouble(),
      pageController: PreloadPageController(initialPage: index),
    );
  }

  void onTapPhoto(
    double width,
    double dx,
    Shop shop,
    Function nextPage,
    Function previousPage,
    BuildContext context,
  ) {
    final photoPageController = state.pageController;
    final double currentPhotoIndex = state.currentPhotoPosition;
    final photoListLength = shop.instagramPosts.length;

    // right tap
    if (dx > (width / 2)) {
      AnalyticsClient()
          .logEvent(LogEvent.instagramPostNext, {'dx': dx, 'width': width});
      if (currentPhotoIndex == (photoListLength - 1)) {
        state = state.copyWith(
          pageController: PreloadPageController(
            initialPage: currentPhotoIndex.toInt(),
          ),
        );
        nextPage(context);
      } else {
        photoPageController.nextPage(
          duration: const Duration(milliseconds: 10),
          curve: Curves.linear,
        );
      }
    } else {
      AnalyticsClient()
          .logEvent(LogEvent.instagramPostBack, {'dx': dx, 'width': width});
      // left tap
      if (currentPhotoIndex == 0) {
        previousPage(context);
      } else {
        photoPageController.previousPage(
          duration: const Duration(milliseconds: 10),
          curve: Curves.linear,
        );
      }
    }
  }
}
