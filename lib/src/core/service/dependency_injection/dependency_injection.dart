import 'package:get_it/get_it.dart';
import 'export.dart';

GetIt get locator => GetIt.instance;
Future<void> setupLocator() async {
  await locator.reset();
  await setupCoreDependencies();
  await setupDataDependencies();
  await setupDomainDependencies();
  await setupPresentationDependencies();
}
