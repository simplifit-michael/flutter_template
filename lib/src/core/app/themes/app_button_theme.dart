import 'package:flutter/material.dart';

import '../export.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(AppColor.primary)),
  );
  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(AppColor.primary)),
  );
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(AppColor.primary),
        side: MaterialStateProperty.all(
            const BorderSide(color: AppColor.primary))),
  );

  static const floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: AppColor.primary,
    foregroundColor: AppColor.secondary
  );
}
