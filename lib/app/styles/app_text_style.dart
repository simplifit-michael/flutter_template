import 'package:flutter/material.dart';

import 'app_color.dart';

/// Official Flutter Doc: https://api.flutter.dev/flutter/material/TextTheme-class.html
class AppTextStyle {
  AppTextStyle._();

  //FIXME: Define Fonts
  static const _standardFont = 'Roboto';

  static const TextTheme theme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
  );

  //NOT IN USE!
  static const TextStyle _displayLarge = TextStyle(
    fontSize: 57,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _displayMedium = TextStyle(
    fontSize: 45,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _displaySmall = TextStyle(
    fontSize: 36,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _headlineLarge = TextStyle(
    fontSize: 32,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _headlineMedium = TextStyle(
    fontSize: 28,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _headlineSmall = TextStyle(
    fontSize: 14,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _titleLarge = TextStyle(
    fontSize: 14,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _titleMedium = TextStyle(
    fontSize: 12,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _titleSmall = TextStyle(
    fontSize: 11,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _labelLarge = TextStyle(
    fontSize: 16,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );
  //NOT IN USE!

  static const TextStyle _labelMedium = TextStyle(
    fontSize: 14,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _labelSmall = TextStyle(
    fontSize: 12,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _bodyLarge = TextStyle(
    fontSize: 16,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w700,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _bodyMedium = TextStyle(
    fontSize: 12,
    fontFamily: _standardFont,
    fontWeight: FontWeight.normal,
    color: AppColor.error,
  );

  //NOT IN USE!
  static const TextStyle _bodySmall = TextStyle(
    fontSize: 16,
    fontFamily: _standardFont,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );
}
