import '../export.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
  Future<User?> getUser(String id);
}
