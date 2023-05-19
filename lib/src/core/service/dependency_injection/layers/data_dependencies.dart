import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/src/core/extension/curl_logger_dio_interceptor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../export.dart';
import '/src/data/users/export.dart';
import '/src/core/factory/export.dart';

Future<void> setupDataDependencies() async {
  await _initUsersDataSource(shouldUseHive: true);
}

Future<void> _initUsersDataSource({required bool shouldUseHive}) async {
  final dependencies = locator<EnvironmentVariables>();
  final apiKey = dependencies.apiKey;
  final apiBaseUrl = dependencies.apiBaseUrl;

  final Dio dio = locator<DioFactory>()
      .setBaseUrl(apiBaseUrl)
      .addInterceptor(DioUsersInterceptor(apiKey))
      .addDebugInterceptor(
        PrettyDioLogger(
            request: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: true,
            logPrint: (value) => debugPrint('$value')),
      )
      .addDebugInterceptor(CurlLoggerDioInterceptor())
      .build();
  locator.registerSingleton<RemoteUsersDataSource>(DioUsersDataSourceImpl(dio));

  late final LocalUsersDataSource local;
  if (shouldUseHive) {
    local = HiveUsersDataSourceImpl(locator<HiveInterface>());
    await (local as HiveUsersDataSourceImpl).init();
  } else {
    local = CacheUsersDataSourceImpl();
  }
  locator.registerSingleton<LocalUsersDataSource>(local);
}
