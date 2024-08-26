import 'package:flutter/material.dart';
import 'color.dart';

class AppTheme {
  static ThemeData themeEnglish = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'PlayfairDisplay'),
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      toolbarHeight: 50,
      backgroundColor: AppColor.transparent,
      elevation: 0,
    ),
    fontFamily: "PlayfairDisplay",
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 20),
      displayMedium: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 26),
      bodyLarge: TextStyle(height: 1.5, color: AppColor.grey, fontSize: 14),
    ),
    primarySwatch: Colors.blue,
  );

  static ThemeData themeArabic = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      toolbarHeight: 50,
      backgroundColor: AppColor.transparent,
      elevation: 0,
    ),
    fontFamily: "Cairo",
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 20),
      displayMedium: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 26),
      bodyLarge: TextStyle(height: 1.5, color: AppColor.grey, fontSize: 14),
    ),
    primarySwatch: Colors.blue,
  );
}
