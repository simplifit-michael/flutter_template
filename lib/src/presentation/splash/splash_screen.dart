import 'package:flutter/material.dart';

import '../../core/app/export.dart';
import '../common/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 1),
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(ImageAsset.appLogo),
              ),
              const SizedBox(height: AppUIConstraints.spacing),
              CircularProgressIndicator.adaptive(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          )),
          const Padding(
            padding: EdgeInsets.only(
                bottom: AppUIConstraints.horizontalScreenPadding),
            child: VersionLabel(),
          ),
        ],
      ),
    );
  }
}
