import 'dart:ui';

import 'package:flutter/material.dart';

class FrostBackground extends StatelessWidget {
  final Widget child;
  final BorderRadius radius;
  final double margin;
  final double padding;
  final Color? backgroundColor;
  final double opacity;
  final double shadowOpacity;
  final double shadowOffset;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Color? shadowColor;
  const FrostBackground({
    Key? key,
    this.radius = BorderRadius.zero,
    this.margin = 0,
    this.padding = 0,
    this.backgroundColor,
    this.opacity = 0.5,
    this.shadowOffset = 10,
    this.shadowSpreadRadius = 4,
    this.shadowBlurRadius = 8,
    this.shadowOpacity = 0.5,
    this.shadowColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: (shadowColor ?? Colors.black).withOpacity(shadowOpacity),
              spreadRadius: shadowSpreadRadius,
              offset: Offset(shadowOffset, shadowOffset),
              blurRadius: shadowBlurRadius,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: (backgroundColor != null
                          ? backgroundColor!
                          : Colors.grey.shade200)
                      .withOpacity(opacity)),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
