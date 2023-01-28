import '../export.dart';

abstract class LocalUsersDataSource{
  List<UserModel> getUsers();
  Future<void> setUsers(List<UserModel> users);
  UserModel? getUser(String id);
  Future<void> addUser(UserModel user);
}