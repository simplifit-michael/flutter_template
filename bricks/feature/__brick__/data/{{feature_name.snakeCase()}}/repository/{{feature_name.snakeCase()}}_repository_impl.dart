import 'package:dartz/dartz.dart';

import '../../../shared/error_handling/failures/failure.dart';
import '../../../domain/{{feature_name.snakeCase()}}/model/{{feature_name.snakeCase()}}.dart';
import '../../../domain/{{feature_name.snakeCase()}}/repository/{{feature_name.snakeCase()}}_repository.dart';

class {{feature_name.pascalCase()}}RepositoryImpl extends {{feature_name.pascalCase()}}Repository{
  @override
  Future<Either<FailureType, {{feature_name.pascalCase()}}>> get{{feature_name.pascalCase()}}() {
    // TODO: implement get{{feature_name.pascalCase()}}
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureType, void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} model) {
    // TODO: implement  add{{feature_name.pascalCase()}}
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureType, void>> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} model) {
    // TODO: implement  update{{feature_name.pascalCase()}}
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureType, void>> delete{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} model)
   {
    // TODO: implement  delete{{feature_name.pascalCase()}}
    throw UnimplementedError();
  }
}