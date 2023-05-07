import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/auth/pages/login_screen.dart';
import 'package:whatsapp_clone/features/auth/pages/user_info_screen.dart';
import 'package:whatsapp_clone/features/auth/pages/verification_screen.dart';
import 'package:whatsapp_clone/features/welcome/page/welcome_screen.dart';

abstract class Routes {
  
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String user_info = 'user_info';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case verification:
        final Map pageArguments = routeSettings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationScreen(
            phoneNumber: pageArguments['phoneNumber'],
            smsCodeId: pageArguments['smsCodeId'],
          ),
        );
      case user_info:
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
