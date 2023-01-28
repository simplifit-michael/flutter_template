import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const path = '/splash';
  
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$SplashScreen')),
    );
  }
}
