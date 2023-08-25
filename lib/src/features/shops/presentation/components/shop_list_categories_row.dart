import 'package:specialico/index.dart';

class ShopListCategoriesRow extends ConsumerWidget {
  const ShopListCategoriesRow({super.key});

  static const categoryDisplayData = {
    ShopListCategory.area: ['エリアから', Icons.near_me],
    ShopListCategory.latest: ['新着', Icons.insights],
    ShopListCategory.like: ['いいね', Icons.favorite],
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _buildShopCategoryWidget(context, ShopListCategory.area,
            ref.read(userRepositoryProvider)?.isAnonymous ?? false),
        _buildShopCategoryWidget(context, ShopListCategory.latest,
            ref.read(userRepositoryProvider)?.isAnonymous ?? false),
        _buildShopCategoryWidget(context, ShopListCategory.like,
            ref.read(userRepositoryProvider)?.isAnonymous ?? false),
      ],
    );
  }

  _buildShopCategoryWidget(
      BuildContext context, ShopListCategory category, bool isAnonymous) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      width: 100,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (category == ShopListCategory.area) {
            context.beamToNamed('/home/area');
          } else if (category == ShopListCategory.like && isAnonymous) {
            AuthService.requestSignUp(context, SignUpRequestType.like);
          } else {
            context.beamToNamed('/home/list/${category.name}');
          }
        },
        child: Column(
          children: [
            Container(
              height: 56,
              width: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Material(
                type: MaterialType.transparency,
                clipBehavior: Clip.hardEdge,
                shape: const CircleBorder(),
                child: Center(
                  child: Icon(
                    categoryDisplayData[category]![1] as IconData,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(categoryDisplayData[category]![0] as String),
          ],
        ),
      ),
    );
  }
}
