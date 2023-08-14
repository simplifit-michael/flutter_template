import 'package:dio/dio.dart';
import 'package:flutter_template/src/shared/extension/dio_extension.dart';

import '../dto/{{feature_name.snakeCase()}}_dto.dart';
import '../dto/request/add_{{feature_name.snakeCase()}}_request_body.dart';
import '../dto/request/update_{{feature_name.snakeCase()}}_request_body.dart';

abstract class Remote{{feature_name.pascalCase()}}DataSource {
  Future<{{feature_name.pascalCase()}}DTO?> get{{feature_name.pascalCase()}}();
  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto);
  Future<void> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto);
  Future<void> delete{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto);
}

class Dio{{feature_name.pascalCase()}}DataSource implements Remote{{feature_name.pascalCase()}}DataSource {
  Dio{{feature_name.pascalCase()}}DataSource(this._dio);

  final Dio _dio;

  @override
  Future<{{feature_name.pascalCase()}}DTO?> get{{feature_name.pascalCase()}}() async {
    const route = '/api/{{feature_name.paramCase()}}';
    const method = 'GET';
    final result = await _dio.execute(method: method, route: route);
    return {{feature_name.pascalCase()}}DTO.fromJson(result);
  }

  @override
  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto) async {
    const route = '/api/{{feature_name.paramCase()}}';
    const method = 'POST';
    final requestBody = Add{{feature_name.pascalCase()}}RequestBody(dto);
    await _dio.execute(method: method, route: route, data: requestBody);
  }

  @override
  Future<void> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto) async {
    const route = '/api/{{feature_name.paramCase()}}';
    const method = 'PATCH';
    final requestBody = Update{{feature_name.pascalCase()}}RequestBody(dto);
    await _dio.execute(method: method, route: route, data: requestBody);
  }

  @override
  Future<void> delete{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto) async {
    final route = '/api/{{feature_name.paramCase()}}/$dto';
    const method = 'DELETE';
    await _dio.execute(method: method, route: route);
  }
}
