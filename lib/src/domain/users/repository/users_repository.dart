import 'package:dartz/dartz.dart';

import '../../../core/errors/export.dart';
import '../export.dart';

abstract class UsersRepository {
  Future<Either<FailureType, List<User>>> getUsers();
  Future<Either<FailureType, User>> getUser(String id);
}
