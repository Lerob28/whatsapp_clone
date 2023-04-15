import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';


class CustomElevateButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;

  const CustomElevateButton({
    super.key, 
    this.buttonWidth, 
    required this.onPressed, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        child:  Text(text),
      ),
    );
  }
}