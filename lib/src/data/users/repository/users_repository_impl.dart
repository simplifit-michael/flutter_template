import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';

import '../../../core/service/export.dart';
import '../../../core/errors/export.dart';
import '../export.dart';
import '/src/domain/users/export.dart';

class UsersRepositoryImpl extends UsersRepository {
  final _logger = Logger('$UsersRepositoryImpl');
  final LocalUsersDataSource _local;
  final RemoteUsersDataSource _remote;
  final NetworkService _network;

  UsersRepositoryImpl({
    required LocalUsersDataSource local,
    required RemoteUsersDataSource remote,
    required NetworkService network,
  })  : _local = local,
        _remote = remote,
        _network = network;

  @override
  Future<Either<FailureType, List<User>>> getUsers() async {
    _logger.fine('Request users from Repo');
    List<UserModel> users = _local.getUsers();
    if (users.isEmpty) {
      _logger.fine('No users found locally, requesting remotly');

      final hasConnection = await _network.hasConnection;
      if (!hasConnection) {
        _logger.warning('No internet connection');
        return const Left(FailureType.noInternetConnection);
      }

      try {
        users = await _remote.getUsers();
      } on Exception catch (e) {
        return Left(FailureTypeExtension.fromException(e));
      }
      _local.setUsers(users);
    }
    _logger.fine('Returning ${users.length} users');
    return Right(users.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Either<FailureType, User>> getUser(String id) async {
    _logger.fine('Request user $id from Repo');
    UserModel? user = _local.getUser(id);
    if (user == null) {
      _logger.fine('User not found locally, requesting remotly');

      final hasConnection = await _network.hasConnection;
      if (!hasConnection) {
        _logger.warning('No internet connection');
        return const Left(FailureType.noInternetConnection);
      }

      try {
        user = await _remote.getUser(id);
      } on Exception catch (e) {
        return Left(FailureTypeExtension.fromException(e));
      }
      _local.addUser(user);
    }
    _logger.fine('Returning user $id');
    return Right(user.toDomain());
  }
}
