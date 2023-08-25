import 'package:specialico/index.dart';

part 'shop_service.g.dart';

abstract class ShopService {
  static void initShopRepository(AsyncNotifierProviderRef ref) {
    ref.read(httpMetadataRepositoryProvider);
    ref.read(shopIdsForEachCategoryRepositoryProvider);
    ref.read(shopIdsForEachPrefectureRepositoryProvider);
    ref.read(likedShopDocumentsRepositoryProvider);
    ref.listen(shopRepositoryProvider, (previous, next) {
      // Shop Repositoryに新しくshopが追加されたら、そのsnippetをShop Snippet Repositoryにも追加する
      final newItemCount =
          next.length - (previous == null ? 0 : previous.length);
      if (newItemCount == 0) return;

      ref.read(shopSnippetRepositoryProvider.notifier).addShopSnippetsToRepo(
            next
                .getRange(
                  (next.length - newItemCount),
                  next.length,
                )
                .map((shop) => shop.getShopSnippet())
                .toList(),
          );

      // liked shop documentの更新の必要があるか確認する
      ref.read(likedShopDocumentsRepositoryProvider.notifier).checkShops(next
          .getRange(
            (next.length - newItemCount),
            next.length,
          )
          .toList());
    });
  }

  static Future<void> getShopCount(ShopCountRepository shopCountRepo) async {
    await shopCountRepo.getShopCount();
  }

  static Future<void> getRecommendedShops(
    ShopRepository shopRepo,
    ShopIdsForEachCategoryRepository idsRepo,
    Position? position,
  ) async {
    // recommendedShopsを取得し、それらのshopのshopIdをリストで取得する
    final List<String> shopIds = await shopRepo.getRecommendedShops(position);
    Map<String, Object> params = {'shop_count': shopIds.length};
    final isPositionNotNull = position != null;
    if (isPositionNotNull) {
      params['longitude'] = position.longitude;
      params['latitude'] = position.latitude;
      params['geohash'] =
          GeoFirePoint(GeoPoint(position.latitude, position.longitude)).geohash;
    }
    AnalyticsClient().logEvent(
      LogEvent.fetchedRecommendedShops,
      params,
    );
    // Shop Listのカテゴリに対応するショップIDとしてidsRepoにセットする
    idsRepo.setShopIds(ShopListCategory.recommend, shopIds);
  }

  static Future<int> getSpecificLocShops({
    required ShopRepository shopRepo,
    required List<ShopSnippet> snippets,
    required ShopIdsForEachCategoryRepository idsRepo,
    required ShopIdsForEachPrefectureRepository idsPrefRepo,
    required Prefecture? prefecture,
  }) async {
    // はじめて開いたときの処理
    if (snippets.isEmpty) {
      final shopIds = await shopRepo.getSpecificLocShopsFrom(prefecture, null);
      if (prefecture != null) idsPrefRepo.setShopIds(prefecture, shopIds);
      idsRepo.setShopIds(ShopListCategory.area, shopIds);
      return shopIds.length;
    }
    // すでにデータを持っていたときの処理
    else if (snippets.isNotEmpty) {
      final startAfter = snippets.last.shopId;
      debugPrint('startAfter: $startAfter, ${snippets.last.name}');
      final shopIds =
          await shopRepo.getSpecificLocShopsFrom(prefecture, startAfter);
      if (prefecture != null) idsPrefRepo.addShopIds(prefecture, shopIds);
      idsRepo.addShopIds(ShopListCategory.area, shopIds);
      return shopIds.length;
    } else {
      return 0;
    }
  }

  /// startAfterIdがnullかつsnippetsが空のとき、orderbyの先頭からデータを取得する
  static Future<int> getLatestShops({
    required ShopRepository shopRepo,
    required List<ShopSnippet> snippets,
    required ShopIdsForEachCategoryRepository idsRepo,
  }) async {
    // はじめて開いたときの処理
    if (snippets.isEmpty) {
      final shopIds = await shopRepo.getLatestShopsFrom(null);
      idsRepo.setShopIds(ShopListCategory.latest, shopIds);
      return shopIds.length;
    }
    // すでにデータを持っていたときの処理
    else if (snippets.isNotEmpty) {
      final startAfter = snippets.last.createdAt;
      final shopIds = await shopRepo.getLatestShopsFrom(startAfter);
      idsRepo.addShopIds(ShopListCategory.latest, shopIds);
      return shopIds.length;
    } else {
      return 0;
    }
  }

  static Future<int> getLikedShops({
    required String userId,
    required ShopRepository shopRepo,
    required ShopSnippetRepository shopSnippetRepo,
    required List<ShopSnippet> snippets,
    required ShopIdsForEachCategoryRepository idsRepo,
    required LikedShopDocumentsRepository likedShopDocRepo,
  }) async {
    // はじめて開いたときの処理
    if (snippets.isEmpty) {
      final shopSnippets = await shopRepo.getLikedShopsFrom(userId, null);
      shopSnippetRepo.checkAndAddShopSnippetsToRepo(shopSnippets);
      final shopIds = shopSnippets.map((snippet) => snippet.shopId).toList();
      idsRepo.setShopIds(ShopListCategory.like, shopIds);
      return shopIds.length;
    }
    // すでにデータを持っていたときの処理
    else if (snippets.isNotEmpty) {
      final startAfter =
          likedShopDocRepo.getDocCreatedAtFromShopId(snippets.last.shopId);
      final shopSnippets = await shopRepo.getLikedShopsFrom(userId, startAfter);
      shopSnippetRepo.checkAndAddShopSnippetsToRepo(shopSnippets);
      final shopIds = shopSnippets.map((snippet) => snippet.shopId).toList();
      idsRepo.addShopIds(ShopListCategory.like, shopIds);
      return shopIds.length;
    } else {
      return 0;
    }
  }

  static Future<void> onPressedLike({
    required BuildContext context,
    required bool isAnonymous,
    required bool isLiked,
    required List<String> likedIds,
    required LikedShopIdsRepository likedShopIdsRepo,
    required ShopRepository shopRepo,
    required ShopIdsForEachCategoryRepository shopIdsForEachCategoryRepo,
    required LikedShopDocumentsRepository likedShopDocumentsRepo,
    required ShopSnippet shopSnippet,
    required String userId,
    required Position? position,
  }) async {
    // ユーザー登録していなかったらlikeできずに、ダイアログを表示する
    if (isAnonymous) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            'ユーザー登録が必要です',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'お持ちのGoogleアカウントやAppleアカウントですぐに登録できます。',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'キャンセル',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await AuthService.signOut();
                await AnalyticsClient().logEvent(LogEvent.signUpRequest, {
                  'type': SignUpRequestType.like.name,
                });
                if (context.mounted) App.restart(context);
              },
              child: const Text('登録に進む'),
            ),
          ],
        ),
      );
    }

    var params = AnalyticsClient.getShopParams(
      shopSnippet: shopSnippet,
      likedIds: likedIds,
      position: position,
    );

    if (!isLiked) {
      await likedShopIdsRepo.like(userId: userId, shopSnippet: shopSnippet);
      AnalyticsClient().logEvent(LogEvent.likeShop, params);
      shopIdsForEachCategoryRepo.addShopId(
          ShopListCategory.like, shopSnippet.shopId);
      likedShopDocumentsRepo.like(shopSnippet, userId);
      shopRepo.updateLikedCount(1, shopSnippet.shopId);
    } else {
      await likedShopIdsRepo.unlike(userId: userId, shopSnippet: shopSnippet);
      AnalyticsClient().logEvent(LogEvent.unlikeShop, params);
      shopIdsForEachCategoryRepo.removeShopId(
          ShopListCategory.like, shopSnippet.shopId);
      likedShopDocumentsRepo.unlike(shopSnippet, userId);
      shopRepo.updateLikedCount(-1, shopSnippet.shopId);
    }
  }

  static Future<void> getShop({
    required ShopRepository shopRepo,
    required String shopId,
  }) async {
    shopRepo.getShop(shopId);
  }

  static Future<void> updateShop({
    required Shop newShop,
    required User user,
    required ShopRepository shopRepo,
  }) async {
    await shopRepo.updateShop(newShop, user);
  }
}

@riverpod
List<ShopSnippet> shopSnippetsOfCategory(
  ShopSnippetsOfCategoryRef ref,
  ShopListCategory category,
) {
  final currentShopSnippets = ref.watch(shopSnippetRepositoryProvider);
  final currentShopIds =
      ref.watch(shopIdsForEachCategoryRepositoryProvider)[category] ?? [];

  if (category == ShopListCategory.latest) {
    final currentShopSnippetsOfCategory = currentShopSnippets
        .where((snippet) => currentShopIds.contains(snippet.shopId))
        .toList();
    currentShopSnippetsOfCategory
        .sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return currentShopSnippetsOfCategory;
  } else if (category == ShopListCategory.area) {
    final currentShops = ref.read(shopRepositoryProvider);
    final shopsOfCategory =
        currentShops.where((e) => currentShopIds.contains(e.shopId)).toList();
    shopsOfCategory.sort((a, b) {
      int cmp = b.likedCount.compareTo(a.likedCount);
      if (cmp != 0) return cmp;
      return a.shopId.compareTo(b.shopId);
    });
    return shopsOfCategory.map((e) => e.getShopSnippet()).toList();
  } else if (category == ShopListCategory.like) {
    final currentShopSnippetsOfCategory = currentShopSnippets
        .where((snippet) => currentShopIds.contains(snippet.shopId))
        .toList();
    final likedShopDocs = ref.read(likedShopDocumentsRepositoryProvider);
    final currentLikedShopsDocs =
        likedShopDocs.where((e) => currentShopIds.contains(e.shopId)).toList();
    currentLikedShopsDocs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return currentLikedShopsDocs
        .map((e) => currentShopSnippetsOfCategory
            .firstWhere((snippet) => snippet.shopId == e.shopId))
        .toList();
  }
  // ShopListCategory.recommend
  else {
    final currentShopSnippetsOfCategory = currentShopSnippets
        .where((snippet) => currentShopIds.contains(snippet.shopId))
        .toList();
    return currentShopSnippetsOfCategory;
  }
}

@riverpod
ShopSnippet shopSnippetOfShopId(ShopSnippetOfShopIdRef ref, String shopId) {
  final currentShopSnippets = ref.watch(shopSnippetRepositoryProvider);
  return currentShopSnippets
      .firstWhere((shopSnippet) => shopSnippet.shopId == shopId);
}

@riverpod
Shop? shopOfShopId(ShopOfShopIdRef ref, String shopId) {
  final currentShop = ref.watch(shopRepositoryProvider);
  final matchedList =
      currentShop.where((shop) => shop.shopId == shopId).toList();
  if (matchedList.isNotEmpty) {
    return matchedList.first;
  } else {
    return null;
  }
}

@riverpod
FutureOr<Metadata?> metadataOfShop(MetadataOfShopRef ref, Shop shop) async {
  if (shop.websiteUrl == null) {
    return null;
  } else {
    return await ref
        .read(httpMetadataRepositoryProvider.notifier)
        .fetchMetadata(shop.websiteUrl!);
  }
}
