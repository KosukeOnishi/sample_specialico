import 'package:specialico/index.dart';

part 'shop_list_screen_controller.g.dart';
part 'shop_list_screen_controller.freezed.dart';

@freezed
class ShopListScreenState with _$ShopListScreenState {
  const factory ShopListScreenState({
    required bool isLoading,
    required bool isFirstFetch,
    @Default(false) isAdLoading,
    @Default(true) isFirstAdsLoading,
    @Default(true) bool isFetchReady,
    @Default([]) List<AdWithView> adList,
  }) = _ShopListScreenState;
}

@riverpod
class ShopListScreenController extends _$ShopListScreenController {
  @override
  ShopListScreenState build(
    ScrollController controller,
    ShopListCategory category,
    Prefecture? prefecture,
    BuildContext context,
  ) {
    debugPrint('ShopListScreenController build');

    late int len;
    bool isFirstFetch = () {
      if (category == ShopListCategory.area) {
        len = ref
                .read(shopIdsForEachPrefectureRepositoryProvider)[prefecture]
                ?.length ??
            0;
        return len == 0;
      } else {
        len = ref.read(shopSnippetsOfCategoryProvider(category)).length;
        return len == 0;
      }
    }();
    bool isLoading = false;
    bool isFirstAdsLoading = category != ShopListCategory.like;

    // 最初のfetchだった場合、読み込み処理を開始
    if (isFirstFetch) {
      isLoading = true;
      switch (category) {
        case ShopListCategory.latest:
          ShopService.getLatestShops(
            shopRepo: ref.read(shopRepositoryProvider.notifier),
            snippets: ref.read(shopSnippetsOfCategoryProvider(category)),
            idsRepo:
                ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
          ).then((_) {
            state = state.copyWith(isLoading: false, isFirstFetch: false);
          });
          break;
        case ShopListCategory.area:
          ShopService.getSpecificLocShops(
            shopRepo: ref.read(shopRepositoryProvider.notifier),
            snippets: ref.read(shopSnippetsOfCategoryProvider(category)),
            idsRepo:
                ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
            idsPrefRepo:
                ref.read(shopIdsForEachPrefectureRepositoryProvider.notifier),
            prefecture: prefecture,
          ).then((count) {
            state = state.copyWith(
              isLoading: false,
              isFirstFetch: false,
              isFetchReady: count == 0 ? false : true,
            );
          });
          break;
        case ShopListCategory.like:
          ShopService.getLikedShops(
            userId: ref.read(userRepositoryProvider)!.userId,
            shopRepo: ref.read(shopRepositoryProvider.notifier),
            shopSnippetRepo: ref.read(shopSnippetRepositoryProvider.notifier),
            snippets: ref.read(shopSnippetsOfCategoryProvider(category)),
            idsRepo:
                ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
            likedShopDocRepo: ref.read(likedShopDocumentsRepositoryProvider.notifier),
          ).then((count) {
            state = state.copyWith(
              isLoading: false,
              isFirstFetch: false,
              isFetchReady: count == 0 ? false : true,
            );
          });
          break;
        default:
          break;
      }
    }

    // 最初の広告の読み込みを開始
    if (isFirstAdsLoading) {
      List<AdWithView> ads = [];
      // 要素数が8以下のとき広告1つ
      if (len <= 8) {
        ads.add(AdmobUtil.getGridNativeAd(
          context: context,
          onAdLoaded: (ad) {
            state = state.copyWith(adList: ads, isFirstAdsLoading: false);
          },
          onAdFailedToLoad: (ad, error) {
            // ignore: avoid_print
            print('$NativeAd failedToLoad: $error');
            ad.dispose();
            state = state.copyWith(isFirstAdsLoading: false);
          },
        )..load());
      }
      // 9以上のとき8個につき1つ
      else {
        final adsNum = len ~/ 8;
        final loadingStatus = List.generate(adsNum, (_) => false);
        ads = List.generate(adsNum, (index) {
          return AdmobUtil.getGridNativeAd(
            context: context,
            onAdLoaded: (ad) {
              loadingStatus[index] = true;
              // すべて読み込みが終わっていたらloading中をfalseにする
              if (!loadingStatus.contains(false)) {
                state = state.copyWith(adList: ads, isFirstAdsLoading: false);
              }
            },
            onAdFailedToLoad: (ad, error) {
              debugPrint('$NativeAd failedToLoad: $error');
              ad.dispose();
              loadingStatus[index] = true;
              if (!loadingStatus.contains(false)) {
                state = state.copyWith(adList: ads, isFirstAdsLoading: false);
              }
            },
          )..load();
        });
      }
    }

    controller.addListener(
      () => _controllerListener(controller, category, prefecture),
    );
    return ShopListScreenState(
      isLoading: isLoading,
      isFirstFetch: isFirstFetch,
      isFirstAdsLoading: isFirstAdsLoading,
    );
  }

  // スクロールコントローラーのリスナー
  void _controllerListener(
    ScrollController self,
    ShopListCategory category,
    Prefecture? prefecture,
  ) async {
    // ローディング中でなく、かつfetch可能時
    if (!state.isLoading && state.isFetchReady) {
      // スクロール位置がmaxの99%以上のとき
      if (self.position.pixels > (self.position.maxScrollExtent * 0.99)) {
        //はじめにLoading中にする
        state = state.copyWith(isLoading: true);
        debugPrint('Set isLoading true');
        // データベースから読み込んで、新たに追加されたドキュメント数を得る
        final addedShopCount = await () async {
          if (category == ShopListCategory.latest) {
            return ShopService.getLatestShops(
              shopRepo: ref.read(shopRepositoryProvider.notifier),
              snippets: ref.read(shopSnippetsOfCategoryProvider(category)),
              idsRepo:
                  ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
            );
          } else if (category == ShopListCategory.area) {
            return ShopService.getSpecificLocShops(
              shopRepo: ref.read(shopRepositoryProvider.notifier),
              snippets: ref.read(shopSnippetsOfCategoryProvider(category)),
              idsRepo:
                  ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
              idsPrefRepo:
                  ref.read(shopIdsForEachPrefectureRepositoryProvider.notifier),
              prefecture: prefecture,
            );
          } else if (category == ShopListCategory.like) {
            return ShopService.getLikedShops(
              userId: ref.read(userRepositoryProvider)!.userId,
              shopRepo: ref.read(shopRepositoryProvider.notifier),
              shopSnippetRepo: ref.read(shopSnippetRepositoryProvider.notifier),
              snippets: ref.read(shopSnippetsOfCategoryProvider(category)),
              idsRepo:
                  ref.read(shopIdsForEachCategoryRepositoryProvider.notifier),
              likedShopDocRepo: ref.read(likedShopDocumentsRepositoryProvider.notifier),
            );
          } else {
            return 0;
          }
        }();
        debugPrint(addedShopCount.toString());
        // 取りきったら取得の処理を無効にする
        if (addedShopCount <= 1) {
          debugPrint('=================================\nfinished fetching\n=================================\n');
          state = state.copyWith(isFetchReady: false);
        }
        // 最後にLoading中をfalseにする
        state = state.copyWith(isLoading: false);
        debugPrint('Set isLoading false');
      }
    }
  }
}

@riverpod
bool shouldShowGridSkelton(
  ShouldShowGridSkeltonRef ref,
  ScrollController controller,
  ShopListCategory category,
  Prefecture? prefecture,
  BuildContext context,
) {
  final state = ref.watch(shopListScreenControllerProvider(
      controller, category, prefecture, context));
  return (state.isFirstFetch && state.isLoading) || state.isFirstAdsLoading;
}
