import 'package:specialico/index.dart';

part 'shop_detail_screen_controller.g.dart';

@riverpod
class ShopDetailScreenController extends _$ShopDetailScreenController {
  @override
  PageController build(int index) {
    return PageController(
      initialPage: index,
      viewportFraction: 1.05,
    );
  }

  void onDismissed(
    List<ShopSnippet> snippets,
    ShopListCategory category,
    BuildContext context,
  ) {
    context.beamBack();
    invalidateControllers(snippets, category);
  }

  void invalidateControllers(List<ShopSnippet> snippets, ShopListCategory category) {
    for (ShopSnippet snippet in snippets) {
      ref.invalidate(shopDetailPageControllerProvider(snippet.shopId, category));
    }
  }

  void nextPage(BuildContext context) {
    final isLastPage = state.position.pixels == state.position.maxScrollExtent;
    if (isLastPage) {
      context.beamBack();
    } else {
      state.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  void previousPage(BuildContext context) {
    final isFirstPage = state.page == 0;
    if (isFirstPage) {
      context.beamBack();
    } else {
      state.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }
}
