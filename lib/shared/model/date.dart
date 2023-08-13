import 'package:freezed_annotation/freezed_annotation.dart';

import '/shared/extension/export.dart';

part 'date.freezed.dart';

@freezed
class Date with _$Date {
  const factory Date({
    required int year,
    required int month,
    required int day,
  }) = _Date;
}

extension DateExtension on Date {
  DateTime toDateTime() => DateTime(year, month, day);

  bool isBefore(Date other) {
    return toDateTime().isBefore(other.toDateTime());
  }

  bool isAfter(Date other) {
    return toDateTime().isAfter(other.toDateTime());
  }

  bool contains(DateTime other) {
    return other.toDate() == this;
  }
}
