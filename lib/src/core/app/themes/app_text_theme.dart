import 'package:flutter/material.dart';

import '../export.dart';

class AppTextTheme {
  AppTextTheme._();
  
  static TextTheme get textTheme => const TextTheme(
        headline1: TextStyle(
          fontFamily: AppFontFamily.standard,
          fontWeight: FontWeight.bold,
          color: AppFontColor.headline,
        ),
        headline2: TextStyle(
          fontFamily: AppFontFamily.standard,
          fontWeight: FontWeight.bold,
          color: AppFontColor.headline,
        ),
        headline3: TextStyle(
          fontFamily: AppFontFamily.standard,
          fontWeight: FontWeight.bold,
          color: AppFontColor.headline,
        ),
        headline4: TextStyle(
          fontFamily: AppFontFamily.standard,
          fontWeight: FontWeight.bold,
          color: AppFontColor.headline,
        ),
        headline5: TextStyle(
          fontFamily: AppFontFamily.standard,
          fontWeight: FontWeight.bold,
          color: AppFontColor.headline,
        ),
        headline6: TextStyle(
          fontFamily: AppFontFamily.standard,
          fontWeight: FontWeight.bold,
          color: AppFontColor.headline,
        ),
        subtitle1: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.headline,
        ),
        subtitle2: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.headline,
        ),
        bodyText1: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.standard,
        ),
        bodyText2: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.standard,
        ),
        caption: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.headline,
        ),
        button: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.button,
        ),
        overline: TextStyle(
          fontFamily: AppFontFamily.standard,
          color: AppFontColor.standard,
        ),
      );
}
