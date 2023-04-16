import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

class ImageBloc extends StatelessWidget {
  const ImageBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
        child: Image.asset(
          'assets/Images/circle.png',
          color: context.theme.circleImageColor?.withOpacity(0.4),
        ),
      ),
    );
  }
}
