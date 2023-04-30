import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/widgets/custom_elevate_button.dart';
import 'package:whatsapp_clone/features/auth/widgets/custom_text_field.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'User Infos',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              'Please provide your name and optional profile image',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.photoIconBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 3,
                  bottom: 5,
                ),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  size: 50,
                  color: context.theme.photoIconColor,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Expanded(
                    child: CustomTextField(
                  hintText: 'How should we call you ?',
                  textAlign: TextAlign.left,
                  autoFocus: true,
                )),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.emoji_emotions,
                  color: context.theme.photoIconColor,
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: CustomElevateButton(
        onPressed: () => {},
        text: 'Next Step',
        buttonWidth: 110,
      ),
    );
  }
}
