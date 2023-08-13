import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/app/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/app/widget/l10n_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/shared/service/app_state/cubit/app_state_cubit.dart';
import 'dart:developer' as developer;

import '../../shared/service/bloc_observer/custom_bloc_observer.dart';
import '../../shared/service/export.dart';
// ignore: unused_import
import '../shared/service/l18n.dart';
import '../shared/widget/connection_monitor.dart';
import '../splash/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<void>? _appLoader;
  late Connectivity _connectivity;

  @override
  void didChangeDependencies() {
    _appLoader ??= _asyncAppInit();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _appLoader = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return L10nProvider(
      child: BlocProvider(
        create: (context) => AppStateCubit(),
        child: ConnectionMonitor(
          connectivity: _connectivity,
          child: FutureBuilder<void>(
            future: _appLoader,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return MaterialApp(
                  theme: AppTheme.getDefaultTheme(),
                  home: const SplashScreen(),
                  //FIXME: initialize applocalization based on your localization strategy
                  // localizationsDelegates: context.localizationDelegates,
                  // supportedLocales: context.supportedLocales,
                  // locale: context.locale,
                  onGenerateTitle: (context) => 'Flutter AppTitle',
                );
              }

              return MaterialApp.router(
                theme: AppTheme.getDefaultTheme(),
                routeInformationParser: router.routeInformationParser,
                routerDelegate: router.routerDelegate,
                routeInformationProvider: router.routeInformationProvider,
                // ignore: lines_longer_than_80_chars
                //FIXME: initialize applocalization based on your localization strategy
                // localizationsDelegates: context.localizationDelegates,
                // supportedLocales: context.supportedLocales,
                // locale: context.locale,
                onGenerateTitle: (context) => 'Flutter AppTitle',
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _asyncAppInit() async {
    _connectivity = Connectivity();
    await _connectivity.checkConnectivity();
    //FIXME: Init your Localization Strategy
    //Translaty
    // await EasyLocalization.ensureInitialized();
    //Localise
    // await Lokalise.init(
    //   projectId: 'PROJECTID',
    //   sdkToken: 'SDK TOKEN',
    // );
    // try {
    //   await Lokalise.instance.update();
    // } catch (e) {}

    // ignore: avoid_redundant_argument_values

    await Firebase.initializeApp();

    Bloc.observer = CustomBlocObserver();

    if (!kIsWeb) {
      FlutterError.onError = _onError;
      PlatformDispatcher.instance.onError =
          (Object error, StackTrace stackTrace) {
        FirebaseCrashlytics.instance
            .recordError(error, stackTrace, fatal: true);
        return true;
      };
    }

    await setupLocator();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  void _onError(FlutterErrorDetails details) {
    developer.log(
      '$details',
      name: 'main',
      error: details.exception,
      stackTrace: details.stack,
    );
    FirebaseCrashlytics.instance.recordFlutterError(details);
  }
}
