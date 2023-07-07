import 'package:flutter_template/src/core/app/app.dart';
import 'package:flutter_template/src/core/service/bloc_observer/custom_bloc_observer.dart';
import 'package:flutter_template/src/core/service/export.dart';
import 'package:flutter_template/src/core/service/l18n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  try {
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  } catch (_) {}

  Bloc.observer = CustomBlocObserver();
  FlutterError.onError = _onError;

  await setupLocator();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(App());
}

void _onError(FlutterErrorDetails details) {
  developer.log('$details', name: 'main', error: details.exception, stackTrace: details.stack);
  FirebaseCrashlytics.instance.recordError(details.exception, details.stack);
}
