import 'package:flutter/material.dart';
import 'package:flutter_template/app/styles/app_text_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getDefaultTheme() {
    return ThemeData(textTheme: AppTextStyle.theme);
  }
}
