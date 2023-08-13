import 'package:flutter/material.dart';
import 'package:flutter_template/app/styles/app_color.dart';
import 'package:flutter_template/app/styles/app_text_style.dart';
import 'package:flutter_template/app/themes/app_button_theme.dart';

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
