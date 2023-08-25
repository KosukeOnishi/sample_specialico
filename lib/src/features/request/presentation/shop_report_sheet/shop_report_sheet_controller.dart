import 'package:specialico/index.dart';

part 'shop_report_sheet_controller.g.dart';
part 'shop_report_sheet_controller.freezed.dart';

@freezed
class ShopReportSheetState with _$ShopReportSheetState {
  const factory ShopReportSheetState({
    @Default({}) Map<ShopReportType, bool> boolFlags,
    @Default(false) bool isLoading,
    @Default(false) bool shouldEnableSubmit,
  }) = _ShopReportSheetState;
}

@riverpod
class ShopReportSheetController extends _$ShopReportSheetController {
  // ignore: annotate_overrides, overridden_fields
  late Shop shop;
  late TextEditingController detailController;

  @override
  ShopReportSheetState build(Shop shop, TextEditingController controller) {
    debugPrint('ShopReportSheetController build');

    shop = shop;
    detailController = controller;

    Map<ShopReportType, bool> flags = {};
    for (ShopReportType reportType in ShopReportType.values) {
      flags[reportType] = false;
    }

    return ShopReportSheetState(boolFlags: flags);
  }

  void onTap(ShopReportType type) {
    Map<ShopReportType, bool> temp = {...state.boolFlags};
    temp[type] = temp[type]! ? false : true;
    state = state.copyWith(
        boolFlags: temp, shouldEnableSubmit: _checkShouldSubmit(temp));
  }

  void onChanged(ShopReportType type, bool value) {
    Map<ShopReportType, bool> temp = {...state.boolFlags};
    temp[type] = value;
    state = state.copyWith(
        boolFlags: temp, shouldEnableSubmit: _checkShouldSubmit(temp));
  }

  void onChangedTextField(String text) {
    if (state.boolFlags[ShopReportType.otherProblems]! && text != '') {
      state = state.copyWith(shouldEnableSubmit: true);
    } else if (state.boolFlags[ShopReportType.otherProblems]! &&
        state.boolFlags.values.where((element) => element).length == 1) {
      state = state.copyWith(shouldEnableSubmit: false);
    }
  }

  bool _checkShouldSubmit(Map<ShopReportType, bool> boolFlags) {
    if (controller.text == '' &&
        boolFlags[ShopReportType.otherProblems]! &&
        boolFlags.values.where((element) => element).length == 1) {
      return false;
    }
    return boolFlags.values.toList().contains(true);
  }

  Future<void> submit(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    await RequestService.sendReport(
      user: ref.read(userRepositoryProvider)!,
      shop: shop,
      boolFlags: state.boolFlags,
      reportDetail: controller.text == '' ? null : controller.text,
    );
    final params = AnalyticsClient.getShopParams(
      shopSnippet: shop.getShopSnippet(),
      likedIds: ref.read(likedShopIdsRepositoryProvider),
      position: ref.read(currentPositionRepositoryProvider),
    );
    AnalyticsClient().logEvent(LogEvent.reportShop, params);
    state = state.copyWith(isLoading: false);
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            '送信完了',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('修正の提案ありがとうございます！☕️'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Center(child: Text('OK')),
            ),
          ],
        ),
      );
      if (context.mounted) Navigator.of(context).pop();
    }
  }
}
