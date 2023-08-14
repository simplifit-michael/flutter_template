import 'package:flutter/material.dart';

import '../../../../generated/export.dart';
import '../styles/app_color.dart';
import '../styles/app_text_style.dart';

class AppInputTheme {
  AppInputTheme._();
  static InputDecorationTheme getTheme() {
    return InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: AppColor.black),
      labelStyle: AppTextStyle.theme.labelMedium,
      hintStyle: AppTextStyle.theme.labelSmall,
      contentPadding: allPadding8,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey200),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.error),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primary),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorStyle: const TextStyle(
        fontSize: 9,
        height: 0.5,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    );
  }
}
