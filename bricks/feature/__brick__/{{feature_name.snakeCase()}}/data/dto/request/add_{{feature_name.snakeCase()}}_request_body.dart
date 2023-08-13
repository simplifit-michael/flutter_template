import '../../../../shared/model/base_dio_request_model.dart';
import '../{{feature_name.snakeCase()}}_dto.dart';

class Add{{feature_name.pascalCase()}}RequestBody extends BaseDioRequestModel {
  Add{{feature_name.pascalCase()}}RequestBody(this.dto);

  final {{feature_name.pascalCase()}}DTO dto;

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
