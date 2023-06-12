import 'package:flutter/material.dart';

import '../../index.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.transparent,
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.darkAccent,
        onPrimary: AppColors.dark3,
        secondary: AppColors.dark3,
        onSecondary: AppColors.white,
        error: AppColors.error,
        onError: AppColors.white,
        background: AppColors.dark1,
        onBackground: AppColors.dark3,
        surface: AppColors.dark2,
        onSurface: AppColors.white,
        onInverseSurface: AppColors.dark3,
        surfaceTint: AppColors.transparent,
        outline: AppColors.dark3,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.transparent,
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff566EED),
          onPrimary: AppColors.white,
          secondary: AppColors.white,
          onSecondary: Color(0xff566EED),
          background: Color(0xfff7f7ff),
          onBackground: AppColors.black,
          error: AppColors.error,
          onError: AppColors.white,
          surface: Color(0xffffffff),
          onSurface: AppColors.black,
          surfaceTint: AppColors.transparent
      ),
    );
  }
  static ThemeData get pinkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.transparent,
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffED56E0),
          onPrimary: AppColors.white,
          secondary: AppColors.white,
          onSecondary: Color(0xffED56E0),
          background: Color(0xffFFF3FE),
          onBackground: AppColors.black,
          error: AppColors.error,
          onError: AppColors.white,
          surface: Color(0xffffffff),
          onSurface: AppColors.black,
          surfaceTint: AppColors.transparent
      ),
    );
  }
}