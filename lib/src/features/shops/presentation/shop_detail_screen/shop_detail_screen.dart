import 'package:specialico/index.dart';

final currentPageItemId = Provider<String>((_) => throw UnimplementedError());
final currentPageItemCategory =
    Provider<ShopListCategory>((_) => throw UnimplementedError());

class ShopDetailScreen extends ConsumerStatefulWidget {
  const ShopDetailScreen({
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

class _ShopDetailScreenState extends ConsumerState<ShopDetailScreen> {
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
  void deactivate() {
    ref
        .read(shopDetailScreenControllerProvider(initialItemIndex!).notifier)
        .invalidateControllers(shopSnippets!, category);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // categoryに対応したsnippetsをwatchする
    shopSnippets = ref.watch(shopSnippetsOfCategoryProvider(category));
    // 最初に表示するShopのindex
    initialItemIndex =
        shopSnippets!.indexWhere((snippet) => snippet.shopId == shopId);
    // initialItemIndexを受け取ってPageControllerを作成
    final controller =
        ref.watch(shopDetailScreenControllerProvider(initialItemIndex!));

    return DismissiblePage(
      onDismissed: () => ref
          .read(shopDetailScreenControllerProvider(initialItemIndex!).notifier)
          .onDismissed(shopSnippets!, category, context),
      direction: DismissiblePageDismissDirection.down,
      minRadius: 0,
      child: AnnotatedRegion(
        // Shop Detail Screenでは、写真に注目を集めるためにBrightnessをdarkにする
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              PageView.builder(
                controller: controller,
                itemCount: shopSnippets!.length,
                itemBuilder: (context, index) {
                  final shopSnippet = shopSnippets![index];

                  return FractionallySizedBox(
                    widthFactor: 1 / 1.05,
                    child: ProviderScope(
                      overrides: [
                        currentPageItemId.overrideWithValue(shopSnippet.shopId),
                        currentPageItemCategory.overrideWithValue(category),
                      ],
                      child: ShopDetailPage(
                        nextPage: ref
                            .read(shopDetailScreenControllerProvider(
                                    initialItemIndex!)
                                .notifier)
                            .nextPage,
                        previousPage: ref
                            .read(shopDetailScreenControllerProvider(
                                    initialItemIndex!)
                                .notifier)
                            .previousPage,
                      ),
                    ),
                  );
                },
              ),
              // Back Button
              const Positioned(
                top: 16,
                left: 16,
                child: SafeArea(
                  child: DisMissPageButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
