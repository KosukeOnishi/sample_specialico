import 'package:specialico/index.dart';

part 'edit_weekday_texts_sheet_controller.g.dart';
part 'edit_weekday_texts_sheet_controller.freezed.dart';

@freezed
class EditWeekdayTextsSheetState with _$EditWeekdayTextsSheetState {
  const factory EditWeekdayTextsSheetState({
    required List<int> openHours,
    required List<int> openMinutes,
    required List<int> closeHours,
    required List<int> closeMinutes,
    required List<bool> isClosedFlags,
    @Default(false) bool isLoading,
  }) = _EditWeekdayTextsSheetState;
}

@riverpod
class EditWeekdayTextsSheetController
    extends _$EditWeekdayTextsSheetController {
  // ignore: annotate_overrides, overridden_fields
  late Shop shop;

  @override
  EditWeekdayTextsSheetState build(Shop shop) {
    debugPrint('EditWeekdayTextsSheetController build');

    shop = shop;

    final List<int> openHours = [];
    final List<int> openMinutes = [];
    final List<int> closeHours = [];
    final List<int> closeMinutes = [];
    final List<bool> isClosedFlags = [];

    for (String openingHourText in shop.weekdayTexts) {
      if (openingHourText == '-') {
        openHours.add(0);
        openMinutes.add(0);
        closeHours.add(0);
        closeMinutes.add(0);
        isClosedFlags.add(true);
      } else {
        openHours.add(int.parse(openingHourText.split(':')[0]));
        openMinutes.add(int.parse(openingHourText.split(':')[1].split('~')[0]));
        closeHours.add(int.parse(openingHourText.split('~')[1].split(':')[0]));
        closeMinutes
            .add(int.parse(openingHourText.split('~')[1].split(':')[1]));
        isClosedFlags.add(false);
      }
    }

    return EditWeekdayTextsSheetState(
      openHours: openHours,
      openMinutes: openMinutes,
      closeHours: closeHours,
      closeMinutes: closeMinutes,
      isClosedFlags: isClosedFlags,
    );
  }

  int? copyIndex;

  void onTapSwitch(int index, bool value) {
    var temp = [...state.isClosedFlags];
    temp[index] = value;
    state = state.copyWith(isClosedFlags: temp);
  }

  void onTapCopy(int index) {
    copyIndex = index;
  }

  void onTapPaste(int index) {
    if (copyIndex == null) return;
    List<int> openHours = [...state.openHours];
    List<int> openMinutes = [...state.openMinutes];
    List<int> closeHours = [...state.closeHours];
    List<int> closeMinutes = [...state.closeMinutes];
    List<bool> isClosedFlags = [...state.isClosedFlags];

    openHours[index] = openHours[copyIndex!];
    openMinutes[index] = openMinutes[copyIndex!];
    closeHours[index] = closeHours[copyIndex!];
    closeMinutes[index] = closeMinutes[copyIndex!];
    isClosedFlags[index] = isClosedFlags[copyIndex!];
    state = state.copyWith(
      openHours: openHours,
      openMinutes: openMinutes,
      closeHours: closeHours,
      closeMinutes: closeMinutes,
      isClosedFlags: isClosedFlags,
    );
  }

  void update(TimeType type, int index, int value) {
    switch (type) {
      case TimeType.openHours:
        final temp = [...state.openHours];
        temp[index] = value;
        state = state.copyWith(openHours: temp);
        break;
      case TimeType.openMinutes:
        final temp = [...state.openMinutes];
        temp[index] = value;
        state = state.copyWith(openMinutes: temp);
        break;
      case TimeType.closeHours:
        final temp = [...state.closeHours];
        temp[index] = value;
        state = state.copyWith(closeHours: temp);
        break;
      case TimeType.closeMinutes:
        final temp = [...state.closeMinutes];
        temp[index] = value;
        state = state.copyWith(closeMinutes: temp);
        break;
      default:
    }
  }

  Future<void> submit(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final Shop shop = _getNewShop();
    await ShopService.updateShop(
      newShop: shop,
      user: ref.read(userRepositoryProvider)!,
      shopRepo: ref.read(shopRepositoryProvider.notifier),
    );
    final params = AnalyticsClient.getShopParams(
      shopSnippet: shop.getShopSnippet(),
      likedIds: ref.read(likedShopIdsRepositoryProvider),
      position: ref.read(currentPositionRepositoryProvider),
    );
    AnalyticsClient().logEvent(LogEvent.updateOpeningHours, params);
    state = state.copyWith(isLoading: false);
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            '更新完了',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('データの更新ありがとうございます！☕️'),
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

  Shop _getNewShop() {
    final List<String> weekdayTexts = [];
    for (int i = 0; i < 7; i++) {
      if (state.isClosedFlags[i]) {
        weekdayTexts.add('-');
      } else {
        final openHour = state.openHours[i].toString();
        final openMinute =
            state.openMinutes[i] == 0 ? '00' : state.openMinutes[i].toString();
        final closeHour = state.closeHours[i].toString();
        final closeMinute = state.closeMinutes[i] == 0
            ? '00'
            : state.closeMinutes[i].toString();
        weekdayTexts.add('$openHour:$openMinute~$closeHour:$closeMinute');
      }
    }
    final user = ref.read(userRepositoryProvider);
    return shop.copyWith(
      weekdayTexts: weekdayTexts,
      weekdayTextsUpdatedAt: DateTime.now(),
      weekdayTextsUpdatedBy: {'userId': user!.userId, 'userName': user.name},
    );
  }
}
