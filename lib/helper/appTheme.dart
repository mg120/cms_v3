import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../services/settings_services.dart';

class AppTheme {
  AppTheme._();

  static final Color primaryColor = Get.find<SettingsService>().primaryColorSettings?.plainValue?.toColor();
  static final Color secondaryColor = Get.find<SettingsService>().secondaryColorSettings?.plainValue?.toColor();
  static const Color greenColor = Color.fromRGBO(62, 196, 149, 1);
  static const Color redColor = Color.fromRGBO(212, 0, 0, 1);
  static const Color lightBlackColor = Color.fromRGBO(64, 64, 63, 1);
  static const Color backgroundColor = Color(0xffFFFFFF);
  static const Color editTxtBgColor = Color(0xffF0F0F0);
  static const Color lightBackgroundColor = Color(0xffAFA8A8);
  static const Color lightGreyTxtColor = Color.fromRGBO(166, 166, 166, 1);
  static const Color borderColor = Color.fromRGBO(246, 246, 246, 1);
  static const Color hintColor = Color(0xff868686);
  static const Color unSelectedColor = Color(0xffB1B1B1);
  static const Color errorColor = Color(0xffB3171C);
  static const Color dividerColor = Color(0xffE3E3E3);
  static const Color blackColor = Colors.black;
  static const Color _iconsColor = Colors.black38;

  static final themeData = ThemeData(
      primaryColor: primaryColor,
      focusColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: GoogleFonts.cairo().fontFamily,
      progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: _iconsColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.cairo(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19
        ),
      ),
      iconTheme: IconThemeData(color: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              } else if (states.contains(MaterialState.pressed)) {
                return secondaryColor;
              } else {
                return primaryColor;
              }
            },
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
      ),
      dividerColor:dividerColor ,
      inputDecorationTheme: inputDecorationTheme(),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:const BorderSide(color: Colors.grey),
    gapPadding: 8,
  );
  OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:const BorderSide(color: Colors.red),
    gapPadding: 8,
  );
  OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(color: AppTheme.primaryColor),
    gapPadding: 8,
  );
  return InputDecorationTheme(
    // contentPadding:const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
    contentPadding: const EdgeInsets.fromLTRB(16.0, 13.0, 16.0, 13.0),
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedInputBorder,
    errorBorder: errorOutlineInputBorder,
    border: outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    errorStyle: TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: Colors.red,
      fontSize: 14,
    ),
  );
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
