import 'package:specialico/index.dart';

final gridItemId = Provider<String>((_) => throw UnimplementedError());
final gridItemCategory =
    Provider<ShopListCategory>((_) => throw UnimplementedError());

class ShopListStaggeredGrid extends ConsumerWidget {
  const ShopListStaggeredGrid({
    super.key,
    required this.category,
    this.scrollController,
    required this.firstAdList,
    required this.firstLength,
  });

  final ShopListCategory category;
  final ScrollController? scrollController;
  final List<AdWithView> firstAdList;
  final int firstLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // categoryに対応するsnippetのリストに変更があれば、以下rebuild
    final List<ShopSnippet> shopSnippets =
        ref.watch(shopSnippetsOfCategoryProvider(category));

    // shopを取得処理後に取得件数が0だったときの表示
    if (shopSnippets.isEmpty && category == ShopListCategory.recommend) {
      return const SliverToBoxAdapter(
        child: Text('10km圏内にSpecialicoに登録されているショップが見つかりませんでした。'),
      );
    } else if (shopSnippets.isEmpty && category == ShopListCategory.area) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(24),
        child: Text('指定のエリアにSpecialicoに登録されているショップが見つかりませんでした。'),
      ));
    } else if (shopSnippets.isEmpty && category == ShopListCategory.like) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(24),
        child: Text('お気に入り登録されているショップがありません。'),
      ));
    } else if (shopSnippets.isEmpty) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(24),
        child: Text('ショップを取得できませんでいsた'),
      ));
    }

    int gridSize = firstLength + firstAdList.length;
    final int addedSnippetsLength = shopSnippets.length - firstLength;
    final addedAdNum = (addedSnippetsLength / 8).ceil();
    gridSize += addedAdNum + addedSnippetsLength;
    final adIndices = [];
    final firstAdIndices = [];

    if (category == ShopListCategory.like) {
      gridSize = shopSnippets.length;
    } else if (category == ShopListCategory.recommend) {
      final adNum = (firstLength / 6).floor();
      for (int i = 0; i < adNum; i++) {
        adIndices.add(6 * (i + 1) + i);
      }
    } else {
      if (firstAdList.isEmpty) {
        if (addedAdNum >= 1) {
          // 最後の要素以外
          for (int i = 1; i < addedAdNum; i++) {
            adIndices.add(firstLength + 8 * i + i);
          }
          // 最後の要素
          adIndices.add(gridSize - 1);
        }
      }
      // 最初の広告の数が1のとき
      if (firstAdList.length == 1) {
        // 最初の広告のindex
        adIndices.add(firstLength);
        firstAdIndices.add(firstLength);
        // 追加された広告があるとき
        if (addedAdNum >= 1) {
          // 最後の要素以外
          for (int i = 1; i < addedAdNum; i++) {
            adIndices.add(firstLength + 8 * i + i);
          }
          // 最後の要素
          adIndices.add(gridSize - 1);
        }
      }
      // 最初の広告の数が2つ以上
      if (firstAdList.length >= 2) {
        // 最初の広告の、最後の要素以外
        for (int i = 1; i < firstAdList.length; i++) {
          adIndices.add(8 * i + i - 1);
        }
        // 最初の広告の最後の要素
        adIndices.add(firstLength + firstAdList.length - 1);
        firstAdIndices.addAll([...adIndices]);
        // 追加された広告があるとき
        if (addedAdNum >= 1) {
          // 最後の要素以外
          for (int i = 1; i < addedAdNum; i++) {
            adIndices.add(firstLength + firstAdList.length - 1 + 8 * i + i);
          }
          // 最後の要素
          adIndices.add(gridSize - 1);
        }
      }
    }

    // debugPrint('shop snippet ' + shopSnippets.length.toString());
    // debugPrint('firstAdList' + firstAdList.length.toString());
    // debugPrint('adIndices' + adIndices.length.toString());
    // debugPrint('adIndices: ' + adIndices.toString());
    // debugPrint('addedAdNum' + addedAdNum.toString());
    // debugPrint('grid size: ' + gridSize.toString());
    // debugPrint('\n');

    // カテゴリがrecommendのときだけ、ホームに表示する用のUIに
    if (category == ShopListCategory.recommend) {
      return SliverList(
        delegate: SliverChildListDelegate([
          StaggeredGrid.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 12,
            crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 3 : 2,
            children: List.generate(gridSize, (index) {
              final shouldShowAd = adIndices.contains(index);
              if (shouldShowAd) {
                return NativeAdItem(index: index, adView: null);
              }

              int snippetIndex = index;
              if (gridSize != shopSnippets.length) {
                snippetIndex -=
                    adIndices.where((element) => element <= index).length;
              }
              return ProviderScope(
                overrides: [
                  gridItemId
                      .overrideWithValue(shopSnippets[snippetIndex].shopId),
                  gridItemCategory.overrideWithValue(category),
                ],
                child: Builder(
                  builder: (newContext) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: snippetIndex == 0 || snippetIndex == 1 ? 4.0 : 0,
                        bottom: snippetIndex == (gridSize - 1) ? 40 : 0,
                      ),
                      child: GestureDetector(
                        child: const ShopListStaggeredGridItem(),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
          const SuggestNewShopButton(),
          const SizedBox(height: 64),
        ]),
      );
    }

    return MasonryGridView.count(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 3 : 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 12,
      itemCount: gridSize,
      itemBuilder: (context, index) {
        final shouldShowAd = adIndices.contains(index);

        if (shouldShowAd) {
          AdWithView? adView;
          if (firstAdIndices.contains(index)) {
            adView = firstAdList[firstAdIndices.indexOf(index)];
          }
          return NativeAdItem(index: index, adView: adView);
        }

        int snippetIndex = index;
        if (gridSize != shopSnippets.length) {
          snippetIndex -= adIndices.where((element) => element <= index).length;
        }

        return ProviderScope(
          overrides: [
            gridItemId.overrideWithValue(shopSnippets[snippetIndex].shopId),
            gridItemCategory.overrideWithValue(category),
          ],
          child: Builder(
            builder: (newContext) {
              return Padding(
                padding: EdgeInsets.only(
                  top: snippetIndex == 0 || snippetIndex == 1 ? 4.0 : 0,
                  bottom: snippetIndex == (gridSize - 1) ? 40 : 0,
                ),
                child: GestureDetector(
                  child: const ShopListStaggeredGridItem(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
