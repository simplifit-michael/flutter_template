import 'package:flutter/material.dart';

import '../export.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getDefaultTheme() {
    return ThemeData(
      colorScheme: AppColorScheme.colorScheme,
      scaffoldBackgroundColor: AppColorScheme.colorScheme.background,
      dialogBackgroundColor: AppColorScheme.colorScheme.secondary,
      cardColor: AppColorScheme.colorScheme.secondary,
      primaryColor: AppColorScheme.colorScheme.primary,
      textTheme: AppTextTheme.textTheme,
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
      floatingActionButtonTheme: AppButtonTheme.floatingActionButtonTheme,
      textButtonTheme: AppButtonTheme.textButtonTheme,
      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
      iconTheme: AppIconTheme.iconTheme,
      inputDecorationTheme: AppInputTheme.inputDecorationTheme,
    );
  }
}
