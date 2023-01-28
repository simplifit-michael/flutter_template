import 'package:flutter/material.dart';

extension TimeOfDayOperations on TimeOfDay {
  bool isBefore(TimeOfDay other) {
    return hour < other.hour || (hour == other.hour && minute < other.minute);
  }

  bool isAfter(TimeOfDay other) {
    return hour > other.hour || (hour == other.hour && minute > other.minute);
  }

  String toDisplayString() {
    final hours = '$hour'.padLeft(2, '0');
    final minutes = '$minute'.padLeft(2, '0');
    return '$hours:$minutes';
  }

  bool isInside(TimeOfDay erliest, TimeOfDay latest) {
    if (toDisplayString().compareTo(erliest.toDisplayString()) < 0) {
      return false;
    }
    if (toDisplayString().compareTo(latest.toDisplayString()) > 0) return false;
    return true;
  }

  static TimeOfDay fromString(String value) {
    final hour = int.tryParse(value.split(':').first) ?? 0;
    final minute = int.tryParse(value.split(':').last) ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }
}
