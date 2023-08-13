import 'package:flutter/material.dart';

@immutable
class ClipShadowPath extends StatelessWidget {
  const ClipShadowPath({
    required this.shadow,
    required this.clipper,
    required this.child,
    super.key,
  });

  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(clipper: clipper, child: child),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  _ClipShadowShadowPainter({required this.shadow, required this.clipper});
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = shadow.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadow.spreadRadius,
      );
    final clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
