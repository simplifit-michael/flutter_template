import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const ColorScheme scheme = ColorScheme(
    brightness: Brightness.light,
    background: AppColor.background,
    onBackground: AppColor.primary,
    error: AppColor.error,
    onError: AppColor.white,
    primary: AppColor.primary,
    onPrimary: AppColor.white,
    secondary: AppColor.secondary,
    onSecondary: AppColor.white,
    surface: AppColor.background,
    onSurface: AppColor.black,
  );

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey200 = Color(0xFFDDDDDD);
  static const Color grey400 = Color(0xFF777777);
  static const Color black = Color(0xFF000000);

  static const Color primary = Color(0xFF02A8AD);
  static const Color secondary = Color(0xFF0B6158);
  static const Color error = Colors.red;

  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFEDEDED);
}
