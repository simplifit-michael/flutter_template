import 'package:flutter_template/src/data/auth/data_source/local_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/data_source/remote_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/repository/auth_repository_impl.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';
import 'package:flutter_template/src/domain/auth/repository/auth_repository.dart';

import '../../../../data/users/export.dart';
import '../../../../domain/users/export.dart';
import '../../export.dart';

Future<void> setupDomainDependencies() async {
  _initAppState();
  _initAuth();
  _initUsers();
}

void _initAppState() {
  locator.registerSingleton<AppStateCubit>(AppStateCubit());
}

void _initAuth() {
  locator.registerSingleton<AuthRepository>(AuthRepositoyImpl(
    local: locator<LocalAuthUserDataSource>(),
    remote: locator<RemoteAuthUserDataSource>(),
    network: locator<NetworkService>(),
  ));

  locator.registerSingleton<AuthBloc>(AuthBloc(
    locator<AuthRepository>(),
    locator<AppStateCubit>(),
  ));
  locator<AuthBloc>().add(const AuthEvent.init());
}

void _initUsers() {
  locator.registerSingleton<UsersRepository>(UsersRepositoryImpl(
    local: locator<LocalUsersDataSource>(),
    remote: locator<RemoteUsersDataSource>(),
    network: locator<NetworkService>(),
  ));

  locator.registerSingleton<UsersBloc>(UsersBloc(
    repo: locator<UsersRepository>(),
    app: locator<AppStateCubit>(),
  ));
}
