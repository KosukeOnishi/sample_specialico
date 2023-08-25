import 'package:specialico/index.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncInit = ref.watch(homeScreenControllerProvider);
    final shopCount = ref.watch(shopCountRepositoryProvider).nationWide;
    final user = ref.watch(userRepositoryProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            slivers: [
              SliverAppBar(
                title: const Text('Specialico'),
                titleSpacing: 0,
                centerTitle: false,
                pinned: false,
                snap: false,
                floating: false,
                actions: [
                  GestureDetector(
                    onTap: () => context.beamToNamed('/home/option'),
                    child: CircleAvatar(
                      foregroundImage: user?.profileImageUrl != null
                          ? NetworkImage(user!.profileImageUrl!)
                          : Image.asset('assets/images/profile_default.png')
                              .image,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      radius: 16,
                    ),
                  ),
                ],
              ),
              // Header
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: double.infinity,
                      // 視覚上のずれを和らげるために、すこし間隔をあける
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedFlipCounter(
                            value: shopCount,
                            duration: const Duration(milliseconds: 500),
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '件のお店からお気に入りの一杯を見つけられます',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ShopListCategoriesRow(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverStickyHeader(
                header: Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  color: Theme.of(context).colorScheme.background,
                  child: Text(
                    ref.watch(isPositionEnabledProvider)
                        ? '近くのおすすめコーヒーショップ'
                        : '人気のコーヒーショップ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                sliver: asyncInit.isLoading
                    ? const ShopStaggeredGridSkelton()
                    : ShopListStaggeredGrid(
                        category: ShopListCategory.recommend,
                        firstAdList: const [],
                        firstLength: ref
                            .read(shopSnippetsOfCategoryProvider(
                                ShopListCategory.recommend))
                            .length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
