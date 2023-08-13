import 'package:flutter/material.dart';
import 'package:flutter_template/app/styles/app_text_style.dart';
import 'package:flutter_template/generated/app_size.dart';

import '../styles/app_color.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static ElevatedButtonThemeData get elevated {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.scheme.onPrimary,
        backgroundColor: AppColor.primary,
        fixedSize: const Size(double.infinity, AppSize.s48),
        textStyle: AppTextStyle.theme.labelMedium,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s16),
          ),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get outlined {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        fixedSize: const Size(double.infinity, AppSize.s48),
        backgroundColor: Colors.transparent,
        textStyle: AppTextStyle.theme.labelMedium,
        side: const BorderSide(color: AppColor.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
