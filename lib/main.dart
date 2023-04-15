import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/themes/dark_theme.dart';
import 'package:whatsapp_clone/common/themes/light_theme.dart';
import 'package:whatsapp_clone/features/welcome/page/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Me',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(), 
    );
  }
}