import 'dart:ui';

import 'package:specialico/index.dart';

class SquareImagePageView extends ConsumerWidget {
  const SquareImagePageView({
    required this.pageState,
    required this.shop,
    required this.category,
    required this.nextPage,
    required this.previousPage,
    super.key,
  });

  final ShopDetailPageState pageState;
  final Shop shop;
  final ShopListCategory category;
  final Function nextPage;
  final Function previousPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: PreloadPageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageState.pageController,
        onPageChanged: (index) => ref
            .read(shopDetailPageControllerProvider(shop.shopId, category)
                .notifier)
            .onPageChanged(index),
        children: [
          for (int index = 0; index < shop.instagramPosts.length; index++) ...{
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ZoomOverlay(
                    twoTouchOnly: true,
                    child: GestureDetector(
                      onTapUp: (details) => ref
                          .read(shopDetailPageControllerProvider(
                                  shop.shopId, category)
                              .notifier)
                          .onTapPhoto(
                            MediaQuery.of(context).size.width,
                            details.globalPosition.dx,
                            shop,
                            nextPage,
                            previousPage,
                            context,
                          ),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${shop.instagramPosts[index].postUrl.split('?')[0]}media/?size=l',
                        placeholder: (context, url) => Container(
                          height: MediaQuery.of(context).size.width,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        fadeInDuration: const Duration(milliseconds: 0),
                        fadeOutDuration: const Duration(milliseconds: 200),
                        cacheManager: JsonCacheManager(),
                        imageBuilder: (context, imageProvider) => Container(
                          height: MediaQuery.of(context).size.width,
                          foregroundDecoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0, -1.5),
                              end: Alignment(0, 0),
                              colors: [Colors.black38, Colors.transparent],
                            ),
                          ),
                          child: Hero(
                            tag: pageState.currentPhotoPosition == 0 &&
                                    pageState.currentPhotoPosition == index
                                ? category.name + shop.shopId
                                : shop.shopId.hashCode.toString() +
                                    index.toString(),
                            transitionOnUserGestures: false,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: MediaQuery.of(context).size.width,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              '投稿を取得できませんでした。',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: GestureDetector(
                    onTap: () {
                      InstagramLauncher.launchPost(
                        shop.instagramPosts[index],
                      );
                      var params = AnalyticsClient.getShopParams(
                        shopSnippet: shop.getShopSnippet(),
                        likedIds: ref.read(likedShopIdsRepositoryProvider),
                        position: ref.read(currentPositionRepositoryProvider),
                      );
                      params['category'] = category.name;
                      params['instagram_user_id'] =
                          shop.instagramPosts[index].instagramUserId;
                      params['media_id'] = shop.instagramPosts[index].mediaId;
                      AnalyticsClient()
                          .logEvent(LogEvent.instagramPostPressed, params);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.white24, Colors.black26],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Colors.white30,
                            ),
                          ),
                          child: Text(
                            '@${shop.instagramPosts[index].instagramUserId}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          },
        ],
      ),
    );
  }
}
