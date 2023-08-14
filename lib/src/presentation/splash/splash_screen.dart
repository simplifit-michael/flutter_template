import 'package:flutter/material.dart';

import '../../../generated/export.dart';
import '../../shared/widget/export.dart';
import '../app/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          verticalMargin0,
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: AppSize.s72,
                  backgroundImage: AssetImage(AppImage.appLogo),
                ),
                verticalMargin24,
                CircularProgressIndicator.adaptive(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
          const Padding(
            padding: bottomPadding16,
            child: VersionLabel(),
          ),
        ],
      ),
    );
  }
}
