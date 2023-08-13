import 'dart:io';

import 'package:flutter/material.dart';

enum DeviceType {
  mobile,
  tablet,
}

class Responsiveness extends StatelessWidget {
  const Responsiveness({
    required Widget onMobile,
    Widget? onTablet,
    Widget? onIOSMobile,
    Widget? onIOSTablet,
    Widget? onMobileLandscape,
    Widget? onTabletLandscape,
    Widget? onIOSMobileLandscape,
    Widget? onIOSTabletLandscape,
    super.key,
  })  : _mobilePortrait = onMobile,
        _tabletPortrait = onTablet ?? //
            onMobile,
        _iOSMobilePortrait = onIOSMobile ?? //
            onMobile,
        _iOSTabletPortrait = onIOSTablet ?? //
            onIOSMobile ??
            onTablet ??
            onMobile,
        _mobileLandscape = onMobileLandscape ?? //
            onMobile,
        _tabletLandscape = onTabletLandscape ?? //
            onTablet ??
            onMobileLandscape ??
            onMobile,
        _iOSMobileLandscape = onIOSMobileLandscape ?? //
            onIOSMobile ??
            onMobileLandscape ??
            onMobile,
        _iOSTabletLandscape = onIOSTabletLandscape ??
            onIOSTablet ??
            onIOSMobileLandscape ??
            onIOSMobile ??
            onTabletLandscape ??
            onTablet ??
            onMobile;
  final Widget _mobilePortrait;
  final Widget _tabletPortrait;
  final Widget _iOSMobilePortrait;
  final Widget _iOSTabletPortrait;
  final Widget _mobileLandscape;
  final Widget _tabletLandscape;
  final Widget _iOSMobileLandscape;
  final Widget _iOSTabletLandscape;

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final isPortrait = Responsiveness.isPortrait(context);
    final device = getDeviceType(context);
    switch (device) {
      case DeviceType.mobile:
        if (isIOS) {
          return isPortrait ? _iOSMobilePortrait : _iOSMobileLandscape;
        } else {
          return isPortrait ? _mobilePortrait : _mobileLandscape;
        }
      case DeviceType.tablet:
        if (isIOS) {
          return isPortrait ? _iOSTabletPortrait : _iOSTabletLandscape;
        } else {
          return isPortrait ? _tabletPortrait : _tabletLandscape;
        }
    }
  }

  static bool isPortrait(BuildContext context) => //
      MediaQuery.of(context).orientation == Orientation.portrait;

  static DeviceType getDeviceType(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final useMobileLayout = shortestSide < 600;
    return useMobileLayout ? DeviceType.mobile : DeviceType.tablet;
  }

  static double calculatePopupWith(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final device = Responsiveness.getDeviceType(context);
    if (device == DeviceType.mobile) return screenWidth;
    return Responsiveness.isPortrait(context) //
        ? screenWidth / 1.5
        : screenWidth / 3;
  }
}
