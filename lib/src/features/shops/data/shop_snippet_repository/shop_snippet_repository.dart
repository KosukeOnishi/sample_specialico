import 'package:specialico/index.dart';

part 'shop_snippet_repository.g.dart';

@Riverpod(keepAlive: true)
class ShopSnippetRepository extends _$ShopSnippetRepository {
  @override
  List<ShopSnippet> build() {
    return <ShopSnippet>[];
  }

  void addShopSnippetToRepo(ShopSnippet shopSnippet) {
    if (state
        .where((element) => element.shopId == shopSnippet.shopId)
        .isNotEmpty) {
      state = [...state, shopSnippet];
    }
  }

  void addShopSnippetsToRepo(List<ShopSnippet> shopSnippets) {
    final currentIds = state.map((e) => e.shopId);
    final newSnippets = shopSnippets.where((e) => !currentIds.contains(e.shopId));
    state = [...state, ...newSnippets];
  }

  void checkAndAddShopSnippetsToRepo(List<ShopSnippet> shopSnippets) {
    final currentShopIds = state.map((e) => e.shopId);
    final newSnippets = shopSnippets
        .where((snippet) => !currentShopIds.contains(snippet.shopId))
        .toList();
    addShopSnippetsToRepo(newSnippets);
  }
}
