import 'dart:convert';

import 'package:dio/dio.dart';
import '../model/base_dio_request_model.dart';

extension DioExtension on Dio {
  Future<dynamic> execute({
    required String method,
    required String route,
    BaseDioRequestModel? data,
    bool retry = false,
  }) async {
    try {
      final requestOptions = RequestOptions(
        baseUrl: options.baseUrl,
        path: route,
        method: method,
        data: data?.toJson(),
      );

      final response = await fetch(requestOptions);
      if (response.data is String) return jsonDecode(response.data);
      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        if (e.error is FormatException) return null;
      }
      if (e.response?.statusCode == 302) return null;
      if (!retry) {
        return await execute(
          route: route,
          method: method,
          data: data,
          retry: true,
        );
      }
      rethrow;
    } catch (e) {
      if (!retry) {
        return await execute(
          route: route,
          method: method,
          data: data,
          retry: true,
        );
      }
      rethrow;
    }
  }
}
