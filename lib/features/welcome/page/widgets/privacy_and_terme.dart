import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(
          text: 'Read our ',
          style: TextStyle(
            color: context.theme.greyColor,
            height: 1.2,
          ),
          children:  [
            TextSpan(
              text: 'Privacy Policies. ',
              style: TextStyle(color: context.theme.blueColor),
            ),
            const TextSpan(text: 'Tap "Agree and Continue" to accept the'),
            TextSpan(
              text: 'Terms of Services.',
              style: TextStyle(color: context.theme.blueColor),
            ),
          ],
        ),
      ),
    );
  }
}
