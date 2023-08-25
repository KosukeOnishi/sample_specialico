import 'package:specialico/index.dart';

class ShopListScreen extends ConsumerStatefulWidget {
  const ShopListScreen({required this.category, this.prefecture, super.key});

  final ShopListCategory category;
  final Prefecture? prefecture;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends ConsumerState<ShopListScreen> {
  late ShopListCategory category;
  Prefecture? prefecture;

  late ScrollController scrollController;

  @override
  void initState() {
    category = widget.category;
    prefecture = widget.prefecture;
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryDisplayData = {
      ShopListCategory.area: '${prefecture?.name ?? '全国'}のコーヒーショップ',
      ShopListCategory.latest: '最近追加されたお店',
      ShopListCategory.like: 'いいねしたコーヒーショップ',
    };
    ref.read(shopListScreenControllerProvider(
      scrollController,
      category,
      prefecture,
      context,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryDisplayData[category]!),
      ),
      body: ref.watch(
        shouldShowGridSkeltonProvider(
            scrollController, category, prefecture, context),
      )
          ? const CustomScrollView(
              slivers: [
                ShopStaggeredGridSkelton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ],
            )
          : ShopListStaggeredGrid(
            category: category,
            scrollController: scrollController,
            firstAdList: ref.watch(shopListScreenControllerProvider(
              scrollController,
              category,
              prefecture,
              context,
            ).select((value) => value.adList)),
            firstLength:
                ref.read(shopSnippetsOfCategoryProvider(category)).length,
          ),
    );
  }
}
