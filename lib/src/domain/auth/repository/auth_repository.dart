import 'package:dartz/dartz.dart';
import 'package:flutter_template/src/core/errors/failures/failure.dart';

import '../entity/auth_user.dart';

abstract class AuthRepository {
  Future<Either<FailureType, AuthUser?>> getCurrentUser();
  Future<Either<FailureType, AuthUser>> signIn(String email, String password);
  Future<Either<FailureType, void>> signOut();
}
