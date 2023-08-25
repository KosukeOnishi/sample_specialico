import 'package:specialico/index.dart';

class ShopStaggeredGridSkelton extends StatelessWidget {
  const ShopStaggeredGridSkelton({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding ?? const EdgeInsets.only(top: 8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 16,
          children: [
            _buildSkeltonWithHeight(120),
            _buildSkeltonWithHeight(160),
            _buildSkeltonWithHeight(200),
            _buildSkeltonWithHeight(140),
            _buildSkeltonWithHeight(120),
            _buildSkeltonWithHeight(200),
            _buildSkeltonWithHeight(200),
            _buildSkeltonWithHeight(200),
          ],
        ),
      ),
    );
  }

  _buildSkeltonWithHeight(double height) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SkeletonLoader(
            builder: Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SkeletonLoader(
            builder: Container(
              height: 14,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
