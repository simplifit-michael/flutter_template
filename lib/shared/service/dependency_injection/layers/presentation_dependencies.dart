import 'package:flutter_template/app/export.dart';

import '../export.dart';

Future<void> setupPresentationDependencies() async {
  _setupAppRouter();
}

void _setupAppRouter() {
  locator.registerLazySingleton(AppRouter.new);
}
