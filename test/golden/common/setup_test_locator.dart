import 'package:flutter_template/src/core/app/export.dart';
import 'package:flutter_template/src/core/service/export.dart';
import 'package:flutter_template/src/data/auth/data_source/local_auth_data_source.dart';
import 'package:flutter_template/src/data/auth/data_source/remote_auth_data_source.dart';
import 'package:flutter_template/src/data/users/export.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';
import 'package:flutter_template/src/domain/auth/entity/auth_user.dart';
import 'package:flutter_template/src/domain/auth/repository/auth_repository.dart';
import 'package:flutter_template/src/domain/users/export.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'setup_test_locator.mocks.dart';

@GenerateMocks([
  LocalAuthUserDataSource,
  RemoteAuthUserDataSource,
  LocalUsersDataSource,
  RemoteUsersDataSource,
  AuthRepository,
  UsersRepository,
  AppStateCubit,
  AuthBloc,
  UsersBloc,
])
Future<void> setupTestLocator() async {
  await locator.reset();

  //DataSources
  locator.registerSingleton<LocalAuthUserDataSource>(MockLocalAuthUserDataSource());
  locator.registerSingleton<RemoteAuthUserDataSource>(MockRemoteAuthUserDataSource());
  locator.registerSingleton<LocalUsersDataSource>(MockLocalUsersDataSource());
  locator.registerSingleton<RemoteUsersDataSource>(MockRemoteUsersDataSource());

  //Repositories
  locator.registerSingleton<AuthRepository>(MockAuthRepository());
  locator.registerSingleton<UsersRepository>(MockUsersRepository());

  //BLoCs
  final authBloc = MockAuthBloc();
  when(authBloc.stream).thenAnswer((_) => const Stream.empty());
  when(authBloc.state).thenReturn(const AuthState.loggedIn(AuthUser(id: 'id')));
  locator.registerSingleton<AuthBloc>(authBloc);

  final userBloc = MockUsersBloc();
  when(userBloc.stream).thenAnswer((_) => const Stream.empty());
  when(userBloc.state).thenReturn(const UsersState.ready([]));
  locator.registerSingleton<UsersBloc>(userBloc);

  final appStateBloc = MockAppStateCubit();
  when(appStateBloc.state).thenReturn(const AppStateState.ready());
  when(appStateBloc.stream).thenAnswer((_) => const Stream.empty());
  locator.registerSingleton<AppStateCubit>(appStateBloc);

  //Presentation
  locator.registerSingleton<AppRouter>(AppRouter(authBloc));
}
