import 'package:flutter/material.dart';

extension OrientationExtension on BuildContext {
  Orientation get orientation => MediaQuery.orientationOf(this);
}
