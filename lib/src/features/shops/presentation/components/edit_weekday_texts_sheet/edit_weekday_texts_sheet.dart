import 'package:specialico/index.dart';

class EditWeekdayTextsSheet extends ConsumerWidget {
  const EditWeekdayTextsSheet({super.key, required this.shop});

  final Shop shop;

  static final timeList = () {
    var temp = [];
    for (int i = 0; i < 24; i++) {
      temp.add('$i');
    }
    return temp;
  }();
  static final minutesList = () {
    var temp = [];
    for (int i = 0; i < 12; i++) {
      temp.add('${i * 5}');
    }
    return temp;
  }();
  static final weekdays = ['月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editWeekdayTextsSheetControllerProvider(shop));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            DirectSelectContainer(
              dragSpeedMultiplier: 3,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          '営業時間を編集する',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '時間を長押しして上下に動かすことで調整できます',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      for (int i = 0; i < 7; i++) ...[
                        _buildHeadline(
                          index: i,
                          text: weekdays[i],
                          isClosed: state.isClosedFlags[i],
                          controller: ref.read(
                              editWeekdayTextsSheetControllerProvider(shop)
                                  .notifier),
                          context: context,
                        ),
                        _buildRow(
                          openHour: state.openHours[i],
                          openMinute: state.openMinutes[i],
                          closeHour: state.closeHours[i],
                          closeMinute: state.closeMinutes[i],
                          isClosed: state.isClosedFlags[i],
                          index: i,
                          controller: ref.read(
                              editWeekdayTextsSheetControllerProvider(shop)
                                  .notifier),
                          context: context,
                        ),
                      ],
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(editWeekdayTextsSheetControllerProvider(shop)
                                .notifier)
                            .submit(context),
                        child: const Center(child: Text('更新する')),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
            if (state.isLoading)
              Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  _buildHeadline({
    required int index,
    required String text,
    required bool isClosed,
    required EditWeekdayTextsSheetController controller,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () => controller.onTapCopy(index),
          icon: const Icon(Icons.copy, size: 18),
        ),
        IconButton(
          onPressed: () => controller.onTapPaste(index),
          icon: const Icon(Icons.paste, size: 18),
        ),
        const Expanded(child: SizedBox()),
        Switch.adaptive(
          value: isClosed,
          onChanged: (value) => controller.onTapSwitch(index, value),
        ),
      ],
    );
  }

  _buildRow({
    required int openHour,
    required int openMinute,
    required int closeHour,
    required int closeMinute,
    required bool isClosed,
    required int index,
    required EditWeekdayTextsSheetController controller,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isClosed
          ? [ const Text('定休日')]
          : [
              _buildSelectList(context, index, openHour, timeList,
                  TimeType.openHours, controller),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('時', style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(width: 8.0),
              _buildSelectList(
                context,
                index,
                (openMinute / 5).round(),
                minutesList,
                TimeType.openMinutes,
                controller,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('分', style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(width: 16),
              const Text('~'),
              const SizedBox(width: 16),
              _buildSelectList(
                context,
                index,
                closeHour,
                timeList,
                TimeType.closeHours,
                controller,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('時', style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(width: 8.0),
              _buildSelectList(
                context,
                index,
                (closeMinute / 5).round(),
                minutesList,
                TimeType.closeMinutes,
                controller,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('分', style: TextStyle(fontSize: 12)),
              ),
            ],
    );
  }

  _buildSelectList(
    BuildContext context,
    int widgetIndex,
    int itemIndex,
    List values,
    TimeType type,
    EditWeekdayTextsSheetController controller,
  ) {
    return SizedBox(
      width: 35,
      child: DirectSelectList(
        onItemSelectedListener: (value, selectedIndex, context) {
          controller.update(type, widgetIndex, int.parse(value));
        },
        values: values,
        defaultItemIndex: itemIndex,
        focusedItemDecoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
            top: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
          ),
        ),
        itemBuilder: (value) => DirectSelectItem(
          value: value,
          scaleFactor: 2.0,
          itemBuilder: (context, value) => Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
