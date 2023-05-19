import 'package:dio/dio.dart';
import 'package:flutter_template/src/data/auth/data_source/remote_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/model/auth_user_model.dart';

class DioAuthDataSource extends RemoteAuthUserDataSource {
  final Dio _dio;

  DioAuthDataSource(this._dio);

  @override
  Future<AuthUserModel> signIn(String email, String password) async {
    return AuthUserModel('id');
  }

  @override
  Future<void> signOut() async {
    _dio;
  }
}
