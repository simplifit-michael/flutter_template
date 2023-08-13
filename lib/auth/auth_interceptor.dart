// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../shared/model/ref.dart';
import 'repository/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  final Ref<AuthRepository?> _authRepo;
  AuthInterceptor(this._authRepo);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _authRepo.value!.getAccessToken();
    options.headers['authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await _authRepo.value?.getAccessToken(force: true);
    }
    super.onError(err, handler);
  }
}
