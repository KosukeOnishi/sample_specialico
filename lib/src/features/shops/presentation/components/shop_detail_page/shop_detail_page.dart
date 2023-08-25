import 'package:specialico/index.dart';

const weekDays = ['月', '火', '水', '木', '金', '土', '日'];

class ShopDetailPage extends ConsumerWidget {
  const ShopDetailPage({
    required this.nextPage,
    required this.previousPage,
    this.topPadding = 4.0,
    super.key,
  });

  final Function nextPage;
  final Function previousPage;
  final double topPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopId = ref.watch(currentPageItemId);
    final category = ref.watch(currentPageItemCategory);
    // shopIdに対して一意なstate
    final Shop? shop = ref.watch(shopOfShopIdProvider(shopId));
    final ShopSnippet snippet = ref.watch(shopSnippetOfShopIdProvider(shopId));
    final controllerState = ref.watch(shopDetailPageControllerProvider(shopId, category));
    final Position? currentPosition =
        ref.watch(currentPositionRepositoryProvider);
    final distanceText = DistanceCalculator.getDistanceText(
      currentPosition,
      snippet.position,
    );

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // 画像領域
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SafeArea(
            child: Stack(
              children: [
                // 画像のpage view
                shop != null
                    ? SquareImagePageView(
                        pageState: controllerState,
                        shop: shop,
                        category: category,
                        nextPage: nextPage,
                        previousPage: previousPage,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                      ),
                // インジケータ
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: ImagePageViewIndicator(
                      dotsCount: shop?.instagramPosts.length ?? 1,
                      position: controllerState.currentPhotoPosition,
                      instagramPosts: shop?.instagramPosts ?? [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Shop情報
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ShopInfoColumn(
              shop: shop,
              snippet: snippet,
              distanceText: distanceText,
              category: category,
            ),
          ),
        ),
      ],
    );
  }
}
