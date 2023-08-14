import 'package:flutter/material.dart';

class L10nProvider extends StatelessWidget {
  const L10nProvider({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //FIXME: Insert Localization Provider here (If there is one)
    return child;
    // EasyLocalization(
    //   supportedLocales: const [Locale('de')],
    //   path: 'assets/translations',
    //   fallbackLocale: const Locale('de'),
    //   child: Builder(builder: (context) => child),
    // );
  }
}
