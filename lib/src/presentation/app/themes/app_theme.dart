import 'package:flutter/material.dart';

import '../export.dart';
import '../styles/app_text_style.dart';
import 'app_button_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getDefaultTheme() {
    return ThemeData(
      textTheme: AppTextStyle.theme,
      elevatedButtonTheme: AppButtonTheme.elevated,
      outlinedButtonTheme: AppButtonTheme.outlined,
      colorScheme: AppColor.scheme,
    );
  }
}
