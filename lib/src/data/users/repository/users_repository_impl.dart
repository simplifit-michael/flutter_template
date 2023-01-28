import 'package:logging/logging.dart';

import '../export.dart';
import '/src/domain/users/export.dart';

class UsersRepositoryImpl extends UsersRepository {
  final _logger = Logger('$UsersRepositoryImpl');
  final LocalUsersDataSource _local;
  final RemoteUsersDataSource _remote;

  UsersRepositoryImpl({
    required LocalUsersDataSource local,
    required RemoteUsersDataSource remote,
  })  : _local = local,
        _remote = remote;

  @override
  Future<List<User>> getUsers() async {
    _logger.fine('Request users from Repo');
    List<UserModel> users = _local.getUsers();
    if (users.isEmpty) {
      _logger.fine('No users found locally, requesting remotly');
      users = await _remote.getUsers();
      _local.setUsers(users);
    }
    _logger.fine('Returning ${users.length} users');
    return users.map((e) => e.toDomain()).toList();
  }

  @override
  Future<User?> getUser(String id) async {
    _logger.fine('Request user $id from Repo');
    UserModel? user = _local.getUser(id);
    if (user == null) {
      _logger.fine('User not found locally, requesting remotly');
      user = await _remote.getUser(id);
      if (user != null) _local.addUser(user);
    }
    _logger.fine('Returning user $id');
    return user?.toDomain();
  }
}
