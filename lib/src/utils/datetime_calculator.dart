abstract class DatetimeCalculator {
  static String getDatetimeGapText(DateTime baseTime) {
    final gap = DateTime.now().difference(baseTime);
    if (gap.inDays >= 365) {
      return '${(gap.inDays / 365).floor().toString()}年前';
    } else if (gap.inDays >= 31) {
      return '${(gap.inDays / 30.5).floor().toString()}か月前';
    } else if (gap.inDays >= 1) {
      return '${gap.inDays.floor().toString()}日前';
    } else if (gap.inHours >= 1) {
      return '${gap.inHours.floor().toString()}時間前';
    } else if (gap.inMinutes >= 1) {
      return '${gap.inMinutes.floor().toString()}分前';
    } else {
      return '${gap.inSeconds.floor().toString()}秒前';
    }
  }
}