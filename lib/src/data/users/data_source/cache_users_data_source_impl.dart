import 'package:logging/logging.dart';

import '../export.dart';

class CacheUsersDataSourceImpl extends LocalUsersDataSource {
  final _logger = Logger('$CacheUsersDataSourceImpl');

  List<UserModel> _users = [];

  @override
  List<UserModel> getUsers() {
    _logger.fine('Returning ${_users.length} users');
    return _users;
  }

  @override
  Future<void> setUsers(List<UserModel> users) async {
    _logger.fine('Storing ${users.length} users');
    _users = users;
  }

  @override
  Future<void> addUser(UserModel user) async {
    _logger.fine('Adding User ${user.id}');
    _users.removeWhere((element) => element.id == user.id);
    _users.add(user);
  }

  @override
  UserModel? getUser(String id) {
    try {
      _logger.fine('Returning User $id');
      return _users.singleWhere((element) => element.id == id);
    } catch (e) {
      _logger.fine('User $id not found');
      return null;
    }
  }
}
