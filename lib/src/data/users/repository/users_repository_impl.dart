import 'package:dartz/dartz.dart';
import 'package:flutter_template/src/core/errors/exceptions/data_layer_exception.dart';
import 'package:flutter_template/src/data/base_repository.dart';

import '../../../core/service/export.dart';
import '../../../core/errors/export.dart';
import '../export.dart';
import '/src/domain/users/export.dart';

class UsersRepositoryImpl extends BaseRepository implements UsersRepository {
  final LocalUsersDataSource _local;
  final RemoteUsersDataSource _remote;

  UsersRepositoryImpl({
    required LocalUsersDataSource local,
    required RemoteUsersDataSource remote,
    required NetworkService network,
  })  : _local = local,
        _remote = remote,
        super(network);

  @override
  Future<Either<FailureType, List<User>>> getUsers({bool force = false}) => getList(
      localGet: _local.getUsers,
      localSet: _local.setUsers,
      remoteGet: _remote.getUsers,
      force: force,
      expectedErrors: [DataLayerExceptionCode.noContent]);

  @override
  Future<Either<FailureType, User>> getUser(String id) => get(
        localGet: () => _local.getUser(id),
        localSet: (_) {},
        remoteGet: () => _remote.getUser(id),
        expectedErrors: [DataLayerExceptionCode.noContent],
      );
}
