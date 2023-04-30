import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme:  const ColorScheme.dark(background: Coloors.backgroundLight) ,
    //backgroundColor: Coloors.backgroundLight,
    scaffoldBackgroundColor: Coloors.backgroundLight,
    extensions: [
      CustomThemeExtension.lightMode,
    ],
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 22
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Coloors.greenLight,
          foregroundColor: Coloors.backgroundLight,
          splashFactory: NoSplash.splashFactory,
          elevation: 3.0,
          shadowColor: Colors.transparent),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Coloors.backgroundLight,
      modalBackgroundColor: Coloors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: Coloors.backgroundLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
