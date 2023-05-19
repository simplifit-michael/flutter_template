import 'package:dartz/dartz.dart';

import '../../../core/errors/export.dart';
import '../export.dart';

abstract class UsersRepository {
  Future<Either<FailureType, List<User>>> getUsers({bool force = false});
  Future<Either<FailureType, User>> getUser(String id);
  Future<Either<FailureType, void>> clear();
}
