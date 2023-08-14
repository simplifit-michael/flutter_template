import 'package:go_router/go_router.dart';

import '../../main/main_screen.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          routes: _buildRoutes(),
          initialLocation: '/',
        );
  static List<GoRoute> _buildRoutes() => [
        GoRoute(
          path: '/',
          builder: (context, state) => const MainScreen(),
        ),
      ];
}
