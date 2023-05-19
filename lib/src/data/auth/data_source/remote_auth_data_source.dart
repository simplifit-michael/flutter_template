import 'package:flutter_template/src/data/auth/model/auth_user_model.dart';

abstract class RemoteAuthUserDataSource {
  Future<AuthUserModel> signIn(String email, String password);
  Future<void> signOut();
}
