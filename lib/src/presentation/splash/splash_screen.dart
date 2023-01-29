import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/app/export.dart';
import '../common/export.dart';

class SplashScreen extends StatefulWidget {
  static const path = '/splash';

  final Sink onAnimationDone;
  const SplashScreen({super.key, required this.onAnimationDone});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.addListener(() => setState(() {}));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.forward().whenComplete(() => widget.onAnimationDone.add(null));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              Transform.rotate(
                angle: _animation.value * math.pi * 2,
                child: const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(ImageAsset.appLogo),
                ),
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
