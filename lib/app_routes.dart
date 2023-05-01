import 'package:go_router/go_router.dart';
import 'package:tap_cash/view/screens/auth/login_screen.dart';
import 'package:tap_cash/view/screens/auth/signup_screen.dart';
import 'package:tap_cash/view/screens/on_board.dart';
import 'package:tap_cash/view/screens/splash_screen.dart';

// GoRouter configuration
abstract class AppRouter {
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String onBoardScreen = '/onBoardScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signupScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: onBoardScreen,
        builder: (context, state) => const OnBoardScreen(),
      ),
    ],
  );
}
