import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/users/export.dart';
import '../../presentation/splash/splash_screen.dart';
import '../service/export.dart';
import 'export.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _appInit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return _buildSplashScreen();
          }
          return _buildApp();
        });
  }

  Widget _buildSplashScreen() => MaterialApp(
        theme: AppTheme.getDefaultTheme(),
        home: const SplashScreen(),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
      );

  Widget _buildApp() {
    final router = locator<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsersBloc(repo: locator()))
      ], //TODO: Add persistent Blocs here!
      child: MaterialApp.router(
        theme: AppTheme.getDefaultTheme(),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
      ),
    );
  }

  Future<void> _appInit() async {
    //Wait at least 1.2 Seconds to end Splashscreen
    await Future.wait([
      setupLocator(),
      Future.delayed(const Duration(milliseconds: 1200)),
    ]);
  }
}
