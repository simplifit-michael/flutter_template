import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_template/src/core/errors/failures/failure.dart';
import 'package:flutter_template/src/core/service/export.dart';
import 'package:flutter_template/src/data/auth/data_source/local_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/data_source/remote_auth_data_source.dart';
import 'package:flutter_template/src/domain/auth/entity/auth_user.dart';
import 'package:flutter_template/src/domain/auth/repository/auth_repository.dart';

class AuthRepositoyImpl extends AuthRepository {
  final RemoteAuthUserDataSource _remote;
  final LocalAuthUserDataSource _local;
  final NetworkService _network;

  AuthRepositoyImpl({
    required RemoteAuthUserDataSource remote,
    required LocalAuthUserDataSource local,
    required NetworkService network,
  })  : _remote = remote,
        _local = local,
        _network = network;

  @override
  Future<Either<FailureType, AuthUser?>> getCurrentUser() async {
    try {
      final currentUser = _local.getCurrentUser();
      return Right(currentUser?.toDomain());
    } on Exception catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(FailureTypeExtension.fromException(e));
    }
  }

  @override
  Future<Either<FailureType, AuthUser>> signIn(String email, String password) async {
    try {
      if (!await _network.hasConnection) return const Left(FailureType.noInternet);
      final user = await _remote.signIn(email, password);
      _local.setCurrentUser(user);
      return Right(user.toDomain());
    } on Exception catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(FailureTypeExtension.fromException(e));
    }
  }

  @override
  Future<Either<FailureType, void>> signOut() async {
    try {
      if (!await _network.hasConnection) return const Left(FailureType.noInternet);
      await _remote.signOut();
      _local.clear();
      return const Right(null);
    } on Exception catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(FailureTypeExtension.fromException(e));
    }
  }
}
