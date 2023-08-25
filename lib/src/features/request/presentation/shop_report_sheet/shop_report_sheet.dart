import 'package:specialico/index.dart';

class ShopReportSheet extends ConsumerStatefulWidget {
  const ShopReportSheet({super.key, required this.shop});

  final Shop shop;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShopReportSheetState();
}

class _ShopReportSheetState extends ConsumerState<ShopReportSheet> {
  late TextEditingController detailController;
  late FocusNode focusNode;
  late Shop shop;

  @override
  void initState() {
    detailController = TextEditingController();
    focusNode = FocusNode();
    shop = widget.shop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(shopReportSheetControllerProvider(shop, detailController));
    final controller = ref.read(
        shopReportSheetControllerProvider(shop, detailController).notifier);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.618,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Focus(
              focusNode: focusNode,
              child: GestureDetector(
                onTap: focusNode.requestFocus,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          '情報の修正を提案する',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '当てはまる項目にチェックしてください',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.wrongShopName),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.wrongAddress),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.wrongPosition),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.invalidMapUrl),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.invalidShopImages),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.invalidInstagramAccount),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.invalidWebsiteUrl),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.notSpecialtyCoffee),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.notCoffeeShop),
                      _buildRow(controller, state.boolFlags,
                          ShopReportType.otherProblems),
                      const SizedBox(height: 16),
                      const Text('詳細 / その他の問題点など'),
                      TextField(
                        controller: detailController,
                        onChanged: (text) =>
                            controller.onChangedTextField(text),
                        cursorColor: Colors.blue,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '気になる点などをご記入ください',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: state.shouldEnableSubmit
                            ? () => controller.submit(context)
                            : null,
                        child: const Center(child: Text('送信する')),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (state.isLoading)
            Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
        ],
      ),
    );
  }

  _buildRow(
    ShopReportSheetController controller,
    Map<ShopReportType, bool> boolFlags,
    ShopReportType type,
  ) {
    return GestureDetector(
      onTap: () => controller.onTap(type),
      child: Row(
        children: [
          Checkbox(
            value: boolFlags[type],
            onChanged: (val) => controller.onChanged(type, val!),
          ),
          Text(type.text),
        ],
      ),
    );
  }
}
