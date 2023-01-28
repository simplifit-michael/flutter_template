import 'package:flutter/material.dart';

enum DeviceType {
  mobile,
  tablet,
}

class Responsiveness extends StatelessWidget {
  final Widget onMobile;
  final Widget onTablet;
  const Responsiveness({
    required this.onMobile,
    required this.onTablet,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final device = getDeviceType(context);
    switch (device) {
      case DeviceType.mobile:
        return onMobile;
      case DeviceType.tablet:
        return onTablet;
    }
  }

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static DeviceType getDeviceType(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    return useMobileLayout ? DeviceType.mobile : DeviceType.tablet;
  }

  static double calculatePopupWith(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final device = Responsiveness.getDeviceType(context);
    if (device == DeviceType.mobile) return screenWidth;
    return Responsiveness.isPortrait(context)
        ? screenWidth / 1.5
        : screenWidth / 3;
  }
}
