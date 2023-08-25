import 'package:specialico/index.dart';

part 'suggest_screen_controller.g.dart';
part 'suggest_screen_controller.freezed.dart';

@freezed
class SuggestScreenState with _$SuggestScreenState {
  const factory SuggestScreenState({
    @Default(false) bool isShopNameValid,
    @Default(false) bool isMapUrlValid,
    @Default(false) bool isUrlForm,
    @Default(true) bool isUrlHalfWidth,
    @Default(false) bool isShopNameSubmitted,
    @Default(false) bool isMapUrlSubmitted,
    @Default(false) bool isLoading,
  }) = _SuggestScreenState;
}

@riverpod
class SuggestScreenController extends _$SuggestScreenController {
  // ignore: annotate_overrides, overridden_fields
  late TextEditingController shopNameController;
  // ignore: annotate_overrides, overridden_fields
  late TextEditingController mapUrlController;

  @override
  SuggestScreenState build(
    TextEditingController shopNameController,
    TextEditingController mapUrlController,
  ) {
    debugPrint('SuggestScreenController build');
    shopNameController = shopNameController;
    mapUrlController = mapUrlController;
    return const SuggestScreenState();
  }

  void submit(BuildContext context) async {
    debugPrint('pressed submit');
    state = state.copyWith(isLoading: true);
    await RequestService.sendRequest(
      user: ref.read(userRepositoryProvider)!,
      mapUrl: mapUrlController.text,
      shopName: shopNameController.text,
    );
    HapticFeedback.mediumImpact();
    AnalyticsClient().logEvent(LogEvent.suggestShop, {
      'shop_name': shopNameController.text,
      'map_url': mapUrlController.text
    });
    state = state.copyWith(isLoading: false);
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            'リクエスト完了',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('ご提案ありがとうございます！☕️'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Center(child: Text('OK')),
            ),
          ],
        ),
      );
    }
    if (context.mounted) Navigator.of(context).pop();
  }

  void onSubmitShopName() {
    state = state.copyWith(isShopNameSubmitted: true);
  }

  void onSubmitMapUrl() {
    state = state.copyWith(isMapUrlSubmitted: true);
  }

  void paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    mapUrlController.text = data?.text ?? '';
    onChangeMapUrl(data?.text ?? '');
    await Future.delayed(const Duration(milliseconds: 100));
    onSubmitMapUrl();
  }

  void onChangeShopName(String value) async {
    state = state.copyWith(
      isShopNameValid: value.isNotEmpty && value.length < 101,
    );
  }

  void onChangeMapUrl(String value) async {
    final isMapUrlForm = _validateUrl(value);
    final isNotFullWidth = !await _hasFullWidth(value);
    state = state.copyWith(
      isUrlForm: isMapUrlForm,
      isUrlHalfWidth: isNotFullWidth,
      isMapUrlValid: isMapUrlForm && isNotFullWidth,
    );
  }

  Widget shopNameValidateText(BuildContext context) {
    if (!state.isShopNameSubmitted) {
      return const SizedBox.shrink();
    } else if (!state.isShopNameValid) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          '1字以上100字以内で入力してください',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget mapUrlValidateText(BuildContext context) {
    if (!state.isMapUrlSubmitted) {
      return const SizedBox.shrink();
    } else if (!state.isUrlForm) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          'Google MapのURLではない可能性があります。Google Mapのお店の詳細ページから、共有を押してURLを取得することができます。',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else if (!state.isUrlHalfWidth) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          '半角英数で入力してください',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  bool _validateUrl(String text) {
    final isFromWebShare = text.contains('https://goo.gl/maps');
    final isFromWebUrl = text.contains('https://www.google.com/maps');
    final isFromApp = text.contains('https://maps.app.goo.gl');
    return isFromWebShare || isFromWebUrl || isFromApp;
  }

  Future<bool> _hasFullWidth(String text) async {
    int stringCount = 0;
    await Future.forEach(text.runes, (int rune) async {
      List<int> bytes = await CharsetConverter.encode(
        'cp932',
        String.fromCharCode(rune),
      );
      stringCount += bytes.length;
    });
    return stringCount != text.length;
  }
}
