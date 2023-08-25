import 'package:specialico/index.dart';

class NativeAdItem extends ConsumerStatefulWidget {
  const NativeAdItem({super.key, required this.index, required this.adView});

  final AdWithView? adView;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NativeAdItemState();
}

class _NativeAdItemState extends ConsumerState<NativeAdItem>
    with AutomaticKeepAliveClientMixin {
  AdWithView? adView;
  late int index;

  @override
  void initState() {
    adView = widget.adView;
    index = widget.index;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final state =
        ref.watch(nativeAdItemControllerProvider(adView, index, context));

    return Container(
      key: ValueKey(index),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: !state.isLoading && state.ad == null ? 0 : 240,
            width: constraints.maxWidth,
            child: !state.isLoading && state.ad != null
                ? AdWidget(ad: state.ad!)
                : state.ad == null
                    ? const SizedBox()
                    : SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SkeletonLoader(
                              builder: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
