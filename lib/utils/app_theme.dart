import 'package:flutter/material.dart';

import 'package:islami_project/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTittleTextStyle = TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.accent);
  static const TextStyle quranTabTittle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.accent);
  static const TextStyle detailsScreenContent =
      TextStyle(fontSize: 24, color: AppColors.accent);
  static const TextStyle settingsTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle tittleLanguageBottomSheat =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  static const TextStyle selectedLanguage = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary);
}
