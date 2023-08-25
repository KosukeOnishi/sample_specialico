import 'package:specialico/index.dart';

class DateTimeConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}

class NullableDateTimeConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const NullableDateTimeConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    return json?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? dateTime) {
    if (dateTime != null) {
      return Timestamp.fromDate(dateTime);
    } else {
      return null;
    }
  }
}
