import 'package:flutter/material.dart';

//screens
import 'package:tessera/features/authentication/view/pages/login_signup_screen.dart';
import 'package:tessera/features/authentication/view/pages/login_screen.dart';
import 'package:tessera/features/authentication/view/pages/login_options_screen.dart';
import 'package:tessera/features/authentication/view/pages/type_new_password_screen.dart';
import 'package:tessera/features/authentication/view/pages/signup_screen.dart';
import 'package:tessera/features/authentication/view/pages/update_password_screen.dart';
import 'package:tessera/features/authentication/view/pages/verification_screen.dart';
import 'package:tessera/features/splash%20screen/view/pages/splash_screen.dart';

import 'package:tessera/features/example/view/pages/example_screen.dart';

/// Acts as the main router for the app. Contains all possible routes.

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/loginOptions':
        return MaterialPageRoute(
          builder: (_) => const LoginOptionsScreen(),
        );
      case '/login_signup':
        return MaterialPageRoute(
          builder: (_) => LoginSignup(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LogIn(),
        );
      case '/updatePassword':
        return MaterialPageRoute(
          builder: (_) => const updatePassword(),
        );
      case '/typenewpassword':
        return MaterialPageRoute(
          builder: (_) => TypeNewPassword(),
        );
      case '/verification':
        return MaterialPageRoute(
          builder: (_) => const verificationScreen(),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ExampleScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
        );
    }
  }
}
