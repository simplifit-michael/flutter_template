import 'package:flutter/material.dart';

import '../export.dart';

class AppColorScheme {
  AppColorScheme._();
  
  static ColorScheme colorScheme = const ColorScheme(
    primary: AppColor.primary,
    secondary: AppColor.secondary,
    secondaryContainer: AppColor.secondary,
    surface: AppColor.background,
    background: AppColor.background,
    error: AppColor.error,
    onPrimary: AppFontColor.standard,
    onSecondary: AppFontColor.button,
    onSurface: AppFontColor.standard,
    onBackground: AppFontColor.button,
    onError: AppFontColor.button,
    brightness: Brightness.light,
  );
}
