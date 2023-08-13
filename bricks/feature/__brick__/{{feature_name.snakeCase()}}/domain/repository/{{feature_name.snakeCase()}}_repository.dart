import 'package:dartz/dartz.dart';

import '../../../shared/error_handling/export.dart';
import '../model/my_feature.dart';

abstract class {{feature_name.pascalCase()}}Repository{
  Future<Either<FailureType, {{feature_name.pascalCase()}}>> get{{feature_name.pascalCase()}}();
  Future<Either<FailureType, void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} model);
  Future<Either<FailureType, void>> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} model);
  Future<Either<FailureType, void>> delete{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} model);
}