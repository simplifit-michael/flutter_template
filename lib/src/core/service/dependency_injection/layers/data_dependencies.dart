import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../export.dart';
import '/src/data/users/export.dart';
import '/src/core/factory/export.dart';

Future<void> setupDataDependencies() async {
  await _initUsersDataSource(shouldUseHive: true);
}

Future<void> _initUsersDataSource({required bool shouldUseHive}) async {
  final apiKey = locator<EnvironmentVariables>().apiKey;

  final Dio dio = locator<DioFactory>()
      .setBaseUrl('https://63d57869dc3c55baf428b20c.mockapi.io/')
      .addInterceptor(DioUsersInterceptor(apiKey))
      .build();
  locator.registerSingleton<RemoteUsersDataSource>(
      DioUsersDataSourceImpl(dio));

  late final LocalUsersDataSource local;
  if (shouldUseHive) {
    local = HiveUsersDataSourceImpl(locator<HiveInterface>());
    await (local as HiveUsersDataSourceImpl).init();
  } else {
    local = CacheUsersDataSourceImpl();
  }
  locator.registerSingleton<LocalUsersDataSource>(local);
}
