import 'package:hive_flutter/hive_flutter.dart';

import '/src/domain/users/export.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String avatar;
  const UserModel({
    required this.id,
    required this.name,
    required this.avatar,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = '${json['id']}',
        name = json['name'],
        avatar = json['avatar'];

  UserModel.fromDomain(User domain)
      : id = domain.id,
        name = domain.name,
        avatar = domain.avatar;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
      };

  User toDomain() => User(
        id: id,
        name: name,
        avatar: avatar,
      );
}
