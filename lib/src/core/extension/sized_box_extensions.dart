import 'package:flutter/material.dart';

extension SizedBoxExtension on SizedBox {
  SizedBox operator +(SizedBox other) {
    return SizedBox(
        height: (height != null || other.height != null) ? ((height ?? 0.0) + (other.height ?? 0.0)) : null,
        width: (width != null || other.width != null) ? ((width ?? 0.0) + (other.width ?? 0.0)) : null);
  }
}

SizedBox get horizontalPadding20 => const SizedBox(width: 20);
SizedBox get verticalPadding20 => const SizedBox(height: 20);

SizedBox test() {
  return horizontalPadding20 + verticalPadding20;
}
