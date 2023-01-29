import '../../../../data/users/export.dart';
import '../../../../domain/users/export.dart';
import '../../export.dart';

Future<void> setupDomainDependencies() async {
  _initUsersRepository();
}

void _initUsersRepository() {
  locator.registerSingleton<UsersRepository>(UsersRepositoryImpl(
    local: locator<LocalUsersDataSource>(),
    remote: locator<RemoteUsersDataSource>(),
    network: locator<NetworkService>(),
  ));
}
