import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/src/core/factory/export.dart';
import '../../export.dart';

Future<void> setupCoreDependencies() async {
  _initEnv();
  await _initThirdParty();
  _initFeaturFlagService(shouldUseSharedPrefs: true);
  _initDioFactory();
}

void _initDioFactory() {
  locator.registerFactory(() => DioFactory());
}

void _initEnv() {
  late final EnvironmentVariables env;
  switch (appEnvironment) {
    case AppEnvironment.dev:
      env = DevEnvironmentVariables();
      break;
    case AppEnvironment.prod:
      env = ProdEnvironmentVariables();
      break;
  }
  locator.registerSingleton<EnvironmentVariables>(env);
}

Future<void> _initThirdParty() async {
  _initLogger();
  await _initHive();
  await _initSharedPref();
}

void _initLogger() {
  Logger.root.level = kDebugMode ? Level.ALL : Level.INFO;
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  locator.registerSingleton(Hive);
}

Future<void> _initSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);
}

Future<void> _initFeaturFlagService(
    {required bool shouldUseSharedPrefs}) async {
  late final LocalFeatureFlagDataSource local;
  if (shouldUseSharedPrefs) {
    local = SharedPrefsFeatureFlagDataSource(locator<SharedPreferences>());
  } else {
    local = HiveFeatureFlagDataSource(locator<HiveInterface>());
    await (local as HiveFeatureFlagDataSource).init();
  }
  locator.registerSingleton<FeatureFlagService>(FeatureFlagServiceImpl(local));
}
