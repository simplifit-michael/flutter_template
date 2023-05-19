import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'src/core/app/export.dart';
import 'src/core/service/bloc_observer/custom_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    //TODO: Initialize Firebase Project!
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  } catch (_) {}

  Bloc.observer = CustomBlocObserver();

  FlutterError.onError = (details) => _onError(details);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));

  runApp(App());
}

void _onError(FlutterErrorDetails details) {
  developer.log('$details', name: 'main', error: details.exception, stackTrace: details.stack);
  FirebaseCrashlytics.instance.recordError(details.exception, details.stack);
}
