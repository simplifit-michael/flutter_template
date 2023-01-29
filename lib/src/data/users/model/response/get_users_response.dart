import '../../export.dart';

class GetUsersResponse {
  final int count;
  final List<UserModel> items;

  GetUsersResponse.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        items = json['items'] == null
            ? []
            : (json['items'] as List)
                .map((e) => UserModel.fromJson(e))
                .toList();
}
