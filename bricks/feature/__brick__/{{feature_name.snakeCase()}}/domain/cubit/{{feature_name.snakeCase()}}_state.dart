part of '{{feature_name.snakeCase()}}_cubit.dart';

@freezed
class {{feature_name.pascalCase()}}State with _${{feature_name.pascalCase()}}State {
  const factory {{feature_name.pascalCase()}}State.initial() = _{{feature_name.pascalCase()}}InitialState;
  const factory {{feature_name.pascalCase()}}State.ready() = _{{feature_name.pascalCase()}}ReadyState;
}
