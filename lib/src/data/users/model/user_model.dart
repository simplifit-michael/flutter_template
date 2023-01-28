import 'package:hive_flutter/hive_flutter.dart';

import '/src/domain/users/export.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  const UserModel({
    required this.id,
    required this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  UserModel.fromDomain(User domain)
      : id = domain.id,
        name = domain.name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  User toDomain() => User(
        id: id,
        name: name,
      );
}
