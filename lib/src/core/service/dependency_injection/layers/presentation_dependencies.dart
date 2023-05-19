import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';

import '../../../app/export.dart';
import '../export.dart';

Future<void> setupPresentationDependencies() async {
  _setupAppRouter();
}

void _setupAppRouter() {
  locator.registerLazySingleton(() => AppRouter(locator<AuthBloc>()));
}
