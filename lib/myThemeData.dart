import 'package:flutter/material.dart';
import 'package:islami_project_flutter/AppColors.dart';

class Mythemedata {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Appcolors.primary_colors_light,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Appcolors.BlackColor)),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Appcolors.BlackColor,
              fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: Appcolors.BlackColor,
            fontSize: 25,
            fontWeight: FontWeight.w700),
        bodySmall: TextStyle(
            color: Appcolors.BlackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
          color: Appcolors.BlackColor,
          fontSize: 25,

        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Appcolors.BlackColor,
            size: 60,
          ),
          unselectedIconTheme: IconThemeData(size: 70)));
}
