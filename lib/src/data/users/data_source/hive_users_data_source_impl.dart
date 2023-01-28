import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

import '../export.dart';

class HiveUsersDataSourceImpl extends LocalUsersDataSource {
  final _boxName = '$LocalUsersDataSource';
  final _logger = Logger('$HiveUsersDataSourceImpl');
  final HiveInterface _hive;
  Box<UserModel> get _box => _hive.box(_boxName);

  HiveUsersDataSourceImpl(this._hive);

  Future<void> init() async {
    _hive.registerAdapter(UserModelAdapter());
    await _hive.openBox<UserModel>(_boxName);
  }

  @override
  List<UserModel> getUsers() {
    final users = _box.values.toList();
    _logger.fine('Returning ${users.length} users');
    return users;
  }

  @override
  Future<void> setUsers(List<UserModel> users) async {
    _logger.fine('Storing ${users.length} users');
    await _box.clear();
    await _box.putAll({for (var e in users) e.id: e});
  }

  @override
  Future<void> addUser(UserModel user) async {
    _logger.fine('Adding User ${user.id}');
    await _box.put(user.id, user);
  }

  @override
  UserModel? getUser(String id) {
    final user = _box.get(id);
    if (user != null) {
      _logger.fine('Returning User $id');
    } else {
      _logger.fine('User $id not found');
    }
    return user;
  }
}
