import 'package:flutter_template/src/data/auth/model/auth_user_model.dart';

abstract class LocalAuthUserDataSource {
  AuthUserModel? getCurrentUser();
  Future<void> setCurrentUser(AuthUserModel model);
  Future<void> clear();
}
