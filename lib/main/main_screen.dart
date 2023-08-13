import 'package:flutter/material.dart';
import 'package:flutter_template/shared/service/app_state/widget/app_state_handler.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const path = '/main';

  @override
  Widget build(BuildContext context) {
    return const AppStateHandler(
      child: Scaffold(
        body: Center(
          child: Text('Flutter Template App'),
        ),
      ),
    );
  }
}
