import 'package:flutter/material.dart';

import '../export.dart';

class AppFontFamily {
  AppFontFamily._();

  static const String standard = 'Roboto';
}

class AppFontColor {
  AppFontColor._();

  static const Color standard = AppColor.secondary;
  static const Color headline = AppColor.primary;
  static const Color button = Color(0xffffffff);
}

class AppFontWeight {
  AppFontWeight._();

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class AppFontSize {
  AppFontSize._();

  static const double regular = 12;
  static const double h1 = 24;
  static const double h2 = 20;
  static const double h3 = 16;
  static const double h4 = 12;
  static const double h5 = 12;
  static const double h6 = 12;
}
