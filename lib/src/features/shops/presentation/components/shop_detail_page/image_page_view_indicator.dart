import 'package:specialico/index.dart';

class ImagePageViewIndicator extends StatelessWidget {
  const ImagePageViewIndicator({
    required this.dotsCount,
    required this.position,
    required this.instagramPosts,
    super.key,
  });

  final int dotsCount;
  final double position;
  final List<InstagramPost> instagramPosts;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        sizes: instagramPosts.map((e) => const Size(32, 4)).toList(),
        spacing: const EdgeInsets.all(4.0),
        activeColor: Colors.white,
        color: Colors.white38,
        activeSizes: instagramPosts.map((e) => const Size(64, 4)).toList(),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
