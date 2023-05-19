import 'package:flutter_template/src/data/base_model.dart';
import 'package:flutter_template/src/domain/auth/entity/auth_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_user_model.g.dart';

@HiveType(typeId: 0)
class AuthUserModel implements BaseModel<AuthUser> {
  @HiveField(0)
  final String id;

  AuthUserModel(this.id);

  @override
  AuthUser toDomain() => AuthUser(id: id);

  AuthUserModel.fromDomain(AuthUser domain) : id = domain.id;

  Map<String, dynamic> toJson() => {"id": id};
  AuthUserModel.fromJson(Map<String, dynamic> json) : id = json["id"];
}
