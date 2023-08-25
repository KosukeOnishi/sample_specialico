import 'package:specialico/index.dart';

class SnippetPageItem extends ConsumerWidget {
  const SnippetPageItem({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(snippetPageItemControllerProvider(place.shopId));
    final position = ref.watch(currentPositionRepositoryProvider);
    final distanceText = DistanceCalculator.getDistanceText(position,
        GeoFirePoint(GeoPoint(place.latLng.latitude, place.latLng.longitude)));

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8.0,
      ),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: state.shop == null
                ? const SizedBox()
                : CachedNetworkImage(
                    imageUrl:
                        '${state.shop!.instagramPosts.first.postUrl.split('?')[0]}media/?size=l',
                    fit: BoxFit.fill,
                    fadeInDuration: const Duration(milliseconds: 0),
                    fadeOutDuration: const Duration(milliseconds: 0),
                    cacheManager: JsonCacheManager(),
                    imageBuilder: (context, imageProvider) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 4.0),
                      Text(
                        place.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.shop?.formattedAddress ?? '-',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            children: [
                              const Icon(Icons.near_me, color: Colors.grey, size: 14),
                              const SizedBox(width: 4.0),
                              Text(
                                distanceText,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 0,
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary),
                      children: [
                        TextSpan(
                          text: ref
                                  .watch(shopOfShopIdProvider(place.shopId))
                                  ?.likedCount
                                  .toString() ??
                              '-',
                        ),
                        TextSpan(
                          text: ' いいね',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
