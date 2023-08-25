import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:specialico/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ShopInfoColumn extends ConsumerWidget {
  const ShopInfoColumn({
    required this.shop,
    required this.snippet,
    required this.distanceText,
    required this.category,
    super.key,
  });

  final Shop? shop;
  final ShopSnippet snippet;
  final String distanceText;
  final ShopListCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metadata = () {
      if (shop != null) {
        return ref.watch(metadataOfShopProvider(shop!));
      } else {
        return null;
      }
    }();
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  snippet.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  if (!ref.read(isLikedProvider(snippet.shopId))) {
                    HapticFeedback.lightImpact();
                    Future.delayed(const Duration(milliseconds: 200))
                        .then((value) => HapticFeedback.lightImpact());
                  }
                  ShopService.onPressedLike(
                    context: context,
                    isAnonymous: ref.read(userRepositoryProvider)!.isAnonymous,
                    isLiked: ref.read(isLikedProvider(snippet.shopId)),
                    likedIds: ref.read(likedShopIdsRepositoryProvider),
                    likedShopIdsRepo:
                        ref.read(likedShopIdsRepositoryProvider.notifier),
                    likedShopDocumentsRepo:
                        ref.read(likedShopDocumentsRepositoryProvider.notifier),
                    shopRepo: ref.read(shopRepositoryProvider.notifier),
                    shopIdsForEachCategoryRepo: ref.read(
                        shopIdsForEachCategoryRepositoryProvider.notifier),
                    shopSnippet: snippet,
                    userId: ref.read(userRepositoryProvider)!.userId,
                    position: ref.read(currentPositionRepositoryProvider),
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      ref.watch(isLikedProvider(snippet.shopId))
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 22,
                      color: ref.watch(isLikedProvider(snippet.shopId))
                          ? Colors.red[600]
                          : Colors.red[600]!.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          _buildSubInfoRow(
            distanceText.contains('km')
                ? Icons.directions_car_outlined
                : Icons.directions_walk_outlined,
            'ここから$distanceText',
            context,
          ),
          const SizedBox(height: 4.0),
          _buildSubInfoRow(
              Icons.pin_drop_outlined, shop?.formattedAddress ?? '', context),
          const SizedBox(height: 16),
          Row(children: [
            _buildButton(
              SvgPicture.asset(
                'assets/images/Google_Maps_icon.svg',
                height: 18,
              ),
              'Google Map',
              () {
                GoogleMapLauncher.launchUrl(shop!);
                var params = AnalyticsClient.getShopParams(
                  shopSnippet: shop!.getShopSnippet(),
                  likedIds: ref.read(likedShopIdsRepositoryProvider),
                  position: ref.read(currentPositionRepositoryProvider),
                );
                var temp = {
                  ...params,
                  ...{
                    'shop_liked_count': shop!.likedCount,
                    'region': shop!.subRegions[0],
                    'place_id': shop!.placeId,
                  }
                };
                AnalyticsClient().logEvent(LogEvent.mapLinkPressed, temp);
              },
            ),
            const SizedBox(width: 24),
            if (shop?.instagramAccountUrl != null)
              _buildButton(
                Image.asset(
                  'assets/images/instagram_icon.png',
                  height: 18,
                ),
                'Instagram',
                () {
                  InstagramLauncher.launchUser(shop!);
                  var params = AnalyticsClient.getShopParams(
                    shopSnippet: shop!.getShopSnippet(),
                    likedIds: ref.read(likedShopIdsRepositoryProvider),
                    position: ref.read(currentPositionRepositoryProvider),
                  );
                  var temp = {
                    ...params,
                    ...{
                      'shop_liked_count': shop!.likedCount,
                      'region': shop!.subRegions[0],
                      'place_id': shop!.placeId,
                    },
                  };
                  AnalyticsClient()
                      .logEvent(LogEvent.instagramAccountPressed, temp);
                },
              ),
          ]),
          const SizedBox(height: 16),
          const Divider(height: 4),
          const SizedBox(height: 24),
          // 概要
          if (shop?.websiteUrl != null || shop?.websiteUrl == '')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeadline('概要', context, null),
                const SizedBox(height: 8.0),
                if (metadata != null)
                  metadata.when(
                    data: (data) {
                      final description = data?.description;
                      if (data == null || description == null) {
                        return const SizedBox();
                      } else {
                        return Text(
                          description,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        );
                      }
                    },
                    error: (_, __) => const Text(
                      'ウェブサイトから情報を取得できませんでした。',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    loading: () => const SkeletonLoader(
                      builder: DescriptionSkelton(),
                    ),
                  ),
                const SizedBox(height: 8.0),
                if (shop?.websiteUrl != null)
                  Row(
                    children: [
                      const Icon(Icons.link, size: 18, color: Colors.grey),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => launchUrlString(shop!.websiteUrl!),
                          child: Text(
                            shop!.websiteUrl!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
              ],
            ),
          _buildHeadline(
            '営業時間',
            context,
            GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                if (ref.read(userRepositoryProvider)!.isAnonymous) {
                  return AuthService.requestSignUp(
                      context, SignUpRequestType.editWeekdayText);
                }
                final params = AnalyticsClient.getShopParams(
                  shopSnippet: shop!.getShopSnippet(),
                  likedIds: ref.read(likedShopIdsRepositoryProvider),
                  position: ref.read(currentPositionRepositoryProvider),
                );
                AnalyticsClient()
                    .logEvent(LogEvent.openEditOpeningHoursModal, params);
                if (shop != null) {
                  showMaterialModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    builder: (context) {
                      return EditWeekdayTextsSheet(shop: shop!);
                    },
                  );
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  size: 18,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          for (int i = 0; i < 7; i++)
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 64,
                      child: Text('${weekDays[i]}曜日:'),
                    ),
                    if (shop != null)
                      Text(
                        shop!.weekdayTexts[i] == '-'
                            ? '定休日'
                            : shop!.weekdayTexts[i],
                      ),
                  ],
                ),
                const SizedBox(height: 4.0),
              ],
            ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(
                Icons.history,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 4.0),
              Text(
                '${DatetimeCalculator.getDatetimeGapText(shop?.weekdayTextsUpdatedAt ?? snippet.createdAt)}に更新 by ${shop?.weekdayTextsUpdatedBy == null ? 'Specialico' : shop?.weekdayTextsUpdatedBy!['userName']}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              if (ref.read(userRepositoryProvider)!.isAnonymous) {
                return AuthService.requestSignUp(
                    context, SignUpRequestType.report);
              }
              final params = AnalyticsClient.getShopParams(
                shopSnippet: shop!.getShopSnippet(),
                likedIds: ref.read(likedShopIdsRepositoryProvider),
                position: ref.read(currentPositionRepositoryProvider),
              );
              AnalyticsClient().logEvent(LogEvent.openReportShopModal, params);
              showMaterialModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                builder: (context) => ShopReportSheet(shop: shop!),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.report, size: 18),
                SizedBox(width: 8.0),
                Text('情報の修正を提案する'),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  _buildSubInfoRow(IconData iconData, String text, BuildContext context) {
    return Row(
      children: [
        Icon(iconData, size: 14, color: Colors.grey),
        const SizedBox(width: 4.0),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  _buildButton(Widget icon, String text, void Function() onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: shop != null ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8.0),
            Text(text),
          ],
        ),
      ),
    );
  }

  _buildHeadline(String text, BuildContext context, Widget? tail) {
    if (tail != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          tail,
        ],
      );
    }
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
