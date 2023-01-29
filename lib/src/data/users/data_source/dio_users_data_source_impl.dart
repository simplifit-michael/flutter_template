import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '../../../core/extension/dio_extension.dart';
import '../../../core/errors/export.dart';
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
      return response.map<UserModel>((e) => UserModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e) {
      _logger.warning(e.toString());
      throw ApiException(code: ApiExceptionCode.invalidResponseBody, message: e.toString());
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    _logger.fine('Requesting User $id');
    final route = 'api/v1/users/$id';
    const method = 'GET';

    try {
      final response = await _dio.execute(route: route, method: method);
      return UserModel.fromJson(response);
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
