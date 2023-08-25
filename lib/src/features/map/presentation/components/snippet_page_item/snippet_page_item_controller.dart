import 'package:specialico/index.dart';

part 'snippet_page_item_controller.freezed.dart';
part 'snippet_page_item_controller.g.dart';

@freezed
class SnippetPageItemState with _$SnippetPageItemState {
  const factory SnippetPageItemState({
    required bool isLoading,
    Shop? shop,
  }) = _SnippetPageItemState;
}

@riverpod
class SnippetPageItemController extends _$SnippetPageItemController {
  @override
  SnippetPageItemState build(String shopId) {
    Shop? shop = ref.read(shopOfShopIdProvider(shopId));
    if (shop != null) {
      return SnippetPageItemState(
        isLoading: false,
        shop: shop,
      );
    } else {
      MapService.getShop(shopId, ref.read(shopRepositoryProvider.notifier))
          .then((newShop) {
        state = state.copyWith(shop: newShop, isLoading: false);
      });
      return const SnippetPageItemState(isLoading: true);
    }
  }
}
