import 'package:go_router/go_router.dart';
import 'package:orda/router/paths.dart';
import 'package:orda/views/auth/auth.dart';
import 'package:orda/views/auth/auth_home.dart';
import 'package:orda/views/home/home.dart';

/// The app router.
class AppRouter {
  /// The app router.
  static final router = GoRouter(
    initialLocation: RoutePaths.authHome,
    routes: [
      GoRoute(
        path: RoutePaths.authHome,
        builder: (context, state) => const AuthHome(),
      ),
      GoRoute(
        path: RoutePaths.auth,
        builder: (context, state) => const Auth(),
      ),
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => const Home(),
      ),
    ],
  );

  /// Go to the home screen.
  static void goToHome() => router.go(RoutePaths.home);
}
