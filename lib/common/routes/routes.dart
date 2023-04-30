import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/auth/pages/login_screen.dart';
import 'package:whatsapp_clone/features/auth/pages/user_info_screen.dart';
import 'package:whatsapp_clone/features/auth/pages/verification_screen.dart';
import 'package:whatsapp_clone/features/welcome/page/welcome_screen.dart';

abstract class Routes {
  static const String WELCOME = 'welcome';
  static const String LOGIN = 'login';
  static const String VERIFICATION = 'verification';
  static const String USER_INFO = 'user_info';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case WELCOME:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case LOGIN:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case VERIFICATION:
        final Map pageArguments = routeSettings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationScreen(
            phoneNumber: pageArguments['phoneNumber'],
            verificationId: pageArguments['verificationId'],
          ),
        );
      case USER_INFO:
        return MaterialPageRoute(
          builder: (context) => const UserInfoScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Placeholder(
                      child: Text('No Page Route Find !'),
                    ),
                  ),
                ));
    }
  }
}
