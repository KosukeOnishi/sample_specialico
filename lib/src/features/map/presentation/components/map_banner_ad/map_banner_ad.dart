import 'package:specialico/index.dart';

class MapBannerAd extends ConsumerWidget {
  const MapBannerAd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapBannerAdControllerProvider(context));
    return SafeArea(
      child: !state.isLoading
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * (50/320),
              child: AdWidget(ad: state.ad!),
            )
          : const SizedBox.shrink(),
    );
  }
}
