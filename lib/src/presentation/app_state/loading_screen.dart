import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/generated/app_margin.dart';

import '../../../generated/app_size.dart';
import '../app/export.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    required this.label,
    required this.iconAsset,
    super.key,
  });

  final String? label;
  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.cardBackground,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: SizedBox(
                    height: AppSize.s120,
                    width: AppSize.s120,
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                      backgroundColor: AppColor.background,
                      strokeWidth: AppSize.s8,
                    ),
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                    // ignore: lines_longer_than_80_chars
                    //FIXME: Replace Dummy Path with correct fallback loading SVG
                    iconAsset ?? '/assets/images/loading.svg',
                    height: AppSize.s48,
                  ),
                ),
              ],
            ),
            verticalMargin8,
            Text(
              //FIXME: Localize Fallback with your choosen l10n Strategy
              label ?? 'Loading...',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
