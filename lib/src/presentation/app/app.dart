import 'package:flutter_template/src/presentation/app/export.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/service/dependency_injection/export.dart';
// ignore: unused_import
import '../../core/service/l18n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();

    return _l10nWrapper(
      MultiBlocProvider(
        providers: [BlocProvider.value(value: locator<AppStateCubit>())],
        child: MaterialApp.router(
          theme: AppTheme.getDefaultTheme(),
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          // ignore: lines_longer_than_80_chars
          //FIXME: initialize applocalization based on your localization strategy
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
        ),
      ),
    );
  }

  Widget _l10nWrapper(Widget child) {
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
