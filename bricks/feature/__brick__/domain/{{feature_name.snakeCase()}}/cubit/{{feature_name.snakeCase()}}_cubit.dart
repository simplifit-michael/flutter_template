import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/service/app_state/cubit/app_state_cubit.dart';

part '{{feature_name.snakeCase()}}_state.dart';
part '{{feature_name.snakeCase()}}_cubit.freezed.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Cubit(this._app) : super(const {{feature_name.pascalCase()}}State.initial());

  // ignore: unused_field
  final AppStateCubit _app;
}
