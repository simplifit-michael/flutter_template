import 'package:flutter_template/src/presentation/main/main_screen.dart';
import 'package:flutter_template/src/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          routes: _buildRoutes(),
          initialLocation: '/',
        );
  static List<GoRoute> _buildRoutes() => [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: MainScreen.path,
          builder: (context, state) => const MainScreen(),
        )
      ];
}
