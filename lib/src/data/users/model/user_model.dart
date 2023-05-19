import 'package:flutter_template/src/data/base_model.dart';

import '/src/domain/users/export.dart';

class UserModel implements BaseModel<User> {
  final String id;
  final String name;
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

  @override
  User toDomain() => User(
        id: id,
        name: name,
        avatar: avatar,
      );
}
