import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/export.dart';

extension DateOperations on DateTime {
  bool isSameDate(DateTime other) => toDate() == other.toDate();

  bool isPastDate() {
    final date = toDate();
    final today = DateTime.now().toDate();
    return date.isBefore(today);
  }

  bool isNotSameDate(DateTime other) => !isSameDate(other);

  Date toDate() => Date(year: year, month: month, day: day);

  TimeOfDay toTimeOfDay() => TimeOfDay(hour: hour, minute: minute);

  DateTime setTime(TimeOfDay tod) =>
      DateTime(year, month, day, tod.hour, tod.minute);

  static DateTime fromBackendDate(String value) =>
      DateFormat('yyyy-MM-dd').parse(value);
}
