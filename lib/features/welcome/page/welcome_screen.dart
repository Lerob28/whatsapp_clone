import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/routes/routes.dart';
import 'package:whatsapp_clone/features/auth/pages/login_screen.dart';
import '../../../common/widgets/custom_elevate_button.dart';
import '../widgets/image_bloc.dart';
import '../widgets/language_selection.dart';
import '../widgets/privacy_and_terme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void navigateToLoginScreen(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(child: ImageBloc()),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Welcome To Lerob Whatsapp',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const PrivacyAndTerms(),
                CustomElevateButton(
                  onPressed: () {
                    //navigateToLoginScreen(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen() ));
                  },
                  text: "AGREE AND CONTINUE",
                ),
                const SizedBox(
                  height: 80,
                ),
                const LanguageSelection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
