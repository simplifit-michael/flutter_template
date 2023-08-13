import 'package:flutter/material.dart';

abstract class LoadingReason {
  bool get isFullScreen;
  String getAppIcon();
  String getDescription(BuildContext context);
}
