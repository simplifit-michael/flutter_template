import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';

import '../../domain/users/export.dart';
import '../../presentation/splash/splash_screen.dart';
import '../service/export.dart';
import 'export.dart';

class App extends StatelessWidget {
  App({super.key}) {
    locator<AuthBloc>().stream.listen(_onAuthStateChanged);
  }

  final _streamController = StreamController();

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
        home: SplashScreen(onAnimationDone: _streamController.sink),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
      );

  Widget _buildApp() {
    final router = locator<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: locator<AppStateCubit>()),
        BlocProvider(create: (_) => locator<UsersBloc>()),
        BlocProvider(create: (_) => locator<AuthBloc>())
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
    await _streamController.stream.first;
    _streamController.close();
  }

  void _onAuthStateChanged(AuthState state) {
    state.whenOrNull(initial: () => locator<UsersBloc>().add(const UsersEvent.reset()));
  }
}
