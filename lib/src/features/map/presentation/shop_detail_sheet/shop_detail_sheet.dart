import 'package:specialico/index.dart';

final GlobalKey shopDetailSheetKey = GlobalKey();

class ShopDetailSheet extends ConsumerStatefulWidget {
  const ShopDetailSheet({
    required this.category,
    required this.shopId,
    super.key,
  });

  final ShopListCategory category;
  final String shopId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShopDetailScreenState();
}

class _ShopDetailScreenState extends ConsumerState<ShopDetailSheet> {
  late ShopListCategory category;
  late String shopId;
  int? initialItemIndex;
  List<ShopSnippet>? shopSnippets;

  @override
  void initState() {
    category = widget.category;
    shopId = widget.shopId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 表示するshop
    final shop = ref.watch(shopOfShopIdProvider(shopId));

    return Container(
      key: shopDetailSheetKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Builder(
              builder: (context) {
                return ProviderScope(
                  overrides: [
                    currentPageItemId.overrideWithValue(shop!.shopId),
                    currentPageItemCategory.overrideWithValue(category),
                  ],
                  child: ShopDetailPage(
                    nextPage: (BuildContext _) {},
                    previousPage: (BuildContext _) {},
                  ),
                );
              },
            ),
            // Back Button
            const Positioned(
              top: 8,
              left: 16,
              child: SafeArea(child: DisMissPageButton()),
            ),
          ],
        ),
      ),
    );
  }
}
