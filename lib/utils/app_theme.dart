import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      canvasColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.accent),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transparent),
      scaffoldBackgroundColor: AppColors.transparent,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.accent),
        bodyMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: AppColors.accent),
        bodySmall: TextStyle(fontSize: 24, color: AppColors.accent),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primary),
        labelLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: AppColors.accent),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accent,
          // iconSize: 32,
          selectedIconTheme: IconThemeData(size: 36),
          selectedLabelStyle: TextStyle(color: AppColors.accent, fontSize: 12),
          unselectedIconTheme: IconThemeData(size: 36)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryDark,
      canvasColor: AppColors.primaryDark,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transparent),
      scaffoldBackgroundColor: AppColors.transparent,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.white),
        bodyMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
        bodySmall: TextStyle(fontSize: 24, color: AppColors.accentDark),
        titleLarge: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.primaryDark),
        titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryDark),
        labelLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: AppColors.accentDark),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentDark,
          selectedIconTheme: IconThemeData(size: 36),
          selectedLabelStyle:
              TextStyle(color: AppColors.accentDark, fontSize: 12),
          unselectedIconTheme: IconThemeData(size: 36)));
}
