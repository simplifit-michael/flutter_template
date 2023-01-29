import '../../export.dart';

class GetUserResponse {
  final UserModel data;

  GetUserResponse.fromJson(Map<String, dynamic> json)
      : data = UserModel.fromJson(json['data']);
}
