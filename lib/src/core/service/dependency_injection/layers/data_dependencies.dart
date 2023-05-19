import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/src/core/extension/curl_logger_dio_interceptor.dart';
import 'package:flutter_template/src/data/auth/data_source/dio_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/data_source/dio_auth_user_interceptor.dart';
import 'package:flutter_template/src/data/auth/data_source/hive_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/data_source/local_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/data_source/remote_auth_data_source.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../export.dart';
import '/src/data/users/export.dart';
import '/src/core/factory/export.dart';

Future<void> setupDataDependencies() async {
  await _initUsersDataSource();
  await _initAuthDataSource();
}

Future<void> _initAuthDataSource() async {
  final dependencies = locator<EnvironmentVariables>();
  final apiKey = dependencies.apiKey;
  final apiBaseUrl = dependencies.apiBaseUrl;

  final Dio dio = locator<DioFactory>()
      .setBaseUrl(apiBaseUrl)
      .addInterceptor(DioAuthUserInterceptor(apiKey))
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

  final remote = DioAuthDataSource(dio);
  locator.registerSingleton<RemoteAuthUserDataSource>(remote);

  final local = HiveAuthUserDataSourceImpl(locator<HiveInterface>());
  await local.init();
  locator.registerSingleton<LocalAuthUserDataSource>(local);
}

Future<void> _initUsersDataSource() async {
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

  locator.registerSingleton<LocalUsersDataSource>(CacheUsersDataSourceImpl());
}
