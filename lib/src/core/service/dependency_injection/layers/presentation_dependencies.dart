import 'package:flutter_template/src/presentation/app/export.dart';
import 'package:flutter_template/src/core/service/dependency_injection/export.dart';

Future<void> setupPresentationDependencies() async {
  _setupAppRouter();
}

void _setupAppRouter() {
  locator.registerLazySingleton(AppRouter.new);
}
