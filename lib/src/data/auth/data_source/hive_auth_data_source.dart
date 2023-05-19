import 'package:flutter_template/src/data/auth/data_source/local_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/model/auth_user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveAuthUserDataSourceImpl extends LocalAuthUserDataSource {
  final _boxName = '$LocalAuthUserDataSource';
  final HiveInterface _hive;
  Box<AuthUserModel> get _box => _hive.box(_boxName);

  HiveAuthUserDataSourceImpl(this._hive);

  Future<void> init() async {
    if (!_hive.isAdapterRegistered(AuthUserModelAdapter().typeId)) {
      _hive.registerAdapter(AuthUserModelAdapter());
    }
    await _hive.openBox<AuthUserModel>(_boxName);
  }

  final _authUserKey = '_authUserKey';

  @override
  AuthUserModel? getCurrentUser() => _box.get(_authUserKey);

  @override
  Future<void> setCurrentUser(AuthUserModel model) => _box.put(_authUserKey, model);

  @override
  Future<void> clear() => _box.clear();
}
