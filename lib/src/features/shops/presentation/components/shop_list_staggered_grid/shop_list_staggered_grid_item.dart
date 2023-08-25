import 'dart:ui';

import 'package:specialico/index.dart';

class ShopListStaggeredGridItem extends ConsumerStatefulWidget {
  const ShopListStaggeredGridItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShopListStaggeredGridItemState();
}

class _ShopListStaggeredGridItemState
    extends ConsumerState<ShopListStaggeredGridItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final shopId = ref.watch(gridItemId);
    final category = ref.watch(gridItemCategory);
    final shopSnippet = ref.watch(shopSnippetOfShopIdProvider(shopId));
    Position? currentPosition;
    if (category == ShopListCategory.recommend) {
      currentPosition = ref.watch(currentPositionRepositoryProvider);
    }
    ref.read(shopListStaggeredGridItemControllerProvider);

    return GestureDetector(
      key: ValueKey(shopId),
      onTap: () => ref
          .read(shopListStaggeredGridItemControllerProvider.notifier)
          .onTap(shopId, category, context),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: shopSnippet.thumbnailImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              fadeInDuration: const Duration(milliseconds: 0),
              fadeOutDuration: const Duration(milliseconds: 0),
              cacheManager: JsonCacheManager(),
              imageBuilder: (context, imageProvider) => Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    constraints: const BoxConstraints(
                      maxHeight: 320,
                      minWidth: double.infinity,
                    ),
                    child: Hero(
                      tag: category.name + shopId,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: imageProvider,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: GestureDetector(
                        onTap: () {
                          if (!ref.read(isLikedProvider(shopId))) {
                            HapticFeedback.mediumImpact();
                            Future.delayed(const Duration(milliseconds: 200))
                                .then((value) => HapticFeedback.lightImpact());
                          }
                          ShopService.onPressedLike(
                            context: context,
                            isAnonymous:
                                ref.read(userRepositoryProvider)!.isAnonymous,
                            isLiked: ref.read(isLikedProvider(shopId)),
                            likedIds: ref.read(likedShopIdsRepositoryProvider),
                            likedShopIdsRepo: ref
                                .read(likedShopIdsRepositoryProvider.notifier),
                            likedShopDocumentsRepo: ref.read(
                                likedShopDocumentsRepositoryProvider.notifier),
                            shopRepo: ref.read(shopRepositoryProvider.notifier),
                            shopIdsForEachCategoryRepo: ref.read(
                                shopIdsForEachCategoryRepositoryProvider
                                    .notifier),
                            shopSnippet: shopSnippet,
                            userId: ref.read(userRepositoryProvider)!.userId,
                            position:
                                ref.read(currentPositionRepositoryProvider),
                          );
                        },
                        child: Stack(
                          children: [
                            ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Colors.white60, Colors.white10],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.white30),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.favorite_outline,
                                size: 18,
                                color: Colors.red[600]!.withOpacity(0.6),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity:
                                  ref.watch(isLikedProvider(shopId)) ? 1.0 : 0,
                              duration: const Duration(milliseconds: 100),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  size: 18,
                                  color: Color(0xffe53935),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              errorWidget: (context, url, error) => Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(child: Text('読み込めませんでした')),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: shopSnippet.name,
                    ),
                    TextSpan(
                      text: ref
                          .read(shopListStaggeredGridItemControllerProvider
                              .notifier)
                          .getSubInfoText(
                              category, currentPosition, shopSnippet),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
