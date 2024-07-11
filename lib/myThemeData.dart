import 'package:flutter/material.dart';
import 'package:islami_project_flutter/AppColors.dart';

class Mythemedata {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Appcolors.primary_colors_light,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          color: Colors.transparent, elevation: 0, centerTitle: true),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Appcolors.BlackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Appcolors.BlackColor,
            size: 70,
          ),
          unselectedIconTheme: IconThemeData(size: 70)));
}
