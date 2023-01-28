import '../export.dart';

abstract class RemoteUsersDataSource {
  Future<List<UserModel>> getUsers();

  Future<UserModel?> getUser(String id);
}
