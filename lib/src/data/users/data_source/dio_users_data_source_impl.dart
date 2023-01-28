import 'package:dio/dio.dart';
import 'package:flutter_template/src/core/extension/dio_extension.dart';
import 'package:logging/logging.dart';

import '../export.dart';

class DioUsersDataSourceImpl extends RemoteUsersDataSource {
  final _logger = Logger('$DioUsersDataSourceImpl');
  final Dio _dio;

  DioUsersDataSourceImpl(this._dio);

  @override
  Future<List<UserModel>> getUsers() async {
    _logger.fine('Requesting Users');
    const route = 'api/v1/users';
    const method = 'GET';

    try {
      final response = await _dio.execute(route: route, method: method);
      final list = response.map((e) => UserModel.fromJson(e)).toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<UserModel?> getUser(String id) async {
    _logger.fine('Requesting User $id');
    final route = 'api/v1/users/$id';
    const method = 'GET';

    try {
      final response = await _dio.execute(route: route, method: method);
      return UserModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}
