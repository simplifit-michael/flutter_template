import 'package:hive_flutter/hive_flutter.dart';

import '../../../shared/model/base_dto.dart';
import '../../domain/model/{{feature_name.snakeCase()}}.dart';

// ignore: unused_import
import '../../../shared/hive_types.dart';

part '{{feature_name.snakeCase()}}_dto.g.dart';

//TODO: include hiveTypeId into hive_types.dart
@HiveType(typeId: {{feature_name.camelCase()}}TypeId)
class {{feature_name.pascalCase()}}DTO implements BaseDto<{{feature_name.pascalCase()}}> {
  const {{feature_name.pascalCase()}}DTO();
  
  // ignore: avoid_unused_constructor_parameters
  const {{feature_name.pascalCase()}}DTO.fromJson(Map<String, dynamic> json);

  @override
  {{feature_name.pascalCase()}} toModel() {
    // TODO: implement toModel
    throw UnimplementedError();
  }
}