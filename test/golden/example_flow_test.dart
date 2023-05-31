import 'package:flutter_template/src/core/service/export.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';
import 'package:flutter_template/src/domain/auth/entity/auth_user.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'common/run_goldens.dart';
import 'common/setup_test_locator.mocks.dart';

void main() {
  testGoldens(
    'Startup',
    (tester) async {
      await runGoldenTest(
        tester,
        'Startup',
        'No Auth',
        setup: () async {
          final mockAuthBlock = locator<AuthBloc>() as MockAuthBloc;
          when(mockAuthBlock.state).thenReturn(const AuthState.initial());
        },
        flow: (tester) => tester.pumpAndSettle(),
      );
    },
  );
  testGoldens(
    'Startup',
    (tester) async {
      await runGoldenTest(
        tester,
        'Startup',
        'Loggedin User',
        setup: () async {
          final mockAuthBloc = locator<AuthBloc>() as MockAuthBloc;
          when(mockAuthBloc.state).thenReturn(const AuthState.loggedIn(AuthUser(id: 'id')));
        },
        flow: (tester) => tester.pumpAndSettle(),
      );
    },
  );
}
