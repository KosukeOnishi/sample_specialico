import 'package:specialico/index.dart';

class AreaChoiceScreen extends ConsumerWidget {
  const AreaChoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(areaChoiceScreenControllerProvider);
    final locationData =
        ref.read(areaChoiceScreenControllerProvider.notifier).getLocationData();
    final countData = ref.watch(shopCountRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('都道府県を選択'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              _buildButton(
                context,
                '全国',
                countData.nationWide,
                () => ref
                    .read(areaChoiceScreenControllerProvider.notifier)
                    .onPressedNationwide(context),
              ),
              const SizedBox(height: 16),
              ...locationData.entries
                  .map(
                    (e) => _buildRegionColumn(
                        ref, context, e.key, e.value, countData),
                  )
                  .toList(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  _buildRegionColumn(
    WidgetRef ref,
    BuildContext context,
    Region region,
    List<Prefecture> prefectures,
    ShopCountData countData,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              region.name,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
          const SizedBox(height: 8.0),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 40,
              mainAxisSpacing: 12,
              crossAxisSpacing: 16,
            ),
            shrinkWrap: true,
            children: prefectures
                .map(
                  (prefecture) => _buildButton(
                    context,
                    prefecture.name,
                    countData.countsOfEachPrefecture[prefecture] ?? 0,
                    () => ref
                        .read(areaChoiceScreenControllerProvider.notifier)
                        .onPressedPrefecture(context, prefecture),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    int count,
    Function onPressed,
  ) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                ),
                children: [
                  TextSpan(
                    text: count.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                    style: TextStyle(fontSize: 4),
                  ),
                  const TextSpan(
                    text: '件',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
