import 'package:go_router/go_router.dart';
import 'package:orda/router/paths.dart';
import 'package:orda/views/auth/signin.dart';
import 'package:orda/views/auth/signup.dart';
import 'package:orda/views/home/home.dart';

/// The app router.
final appRouter = GoRouter(
  initialLocation: RoutePaths.signup,
  routes: [
    GoRoute(
      path: RoutePaths.signup,
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      path: RoutePaths.signin,
      builder: (context, state) => const Signin(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const Home(),
    ),
  ],
);
