import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../index.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      cardColor: AppColors.dark2,
      appBarTheme: AppBarTheme(
        surfaceTintColor: AppColors.transparent,
        actionsIconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
        ),
        elevation: 0,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.transparent,
        titleTextStyle: AppTypography.h5.copyWith(fontWeight: FontWeight.w400),
      ),
      colorScheme: AppColors.colorScheme,
      scaffoldBackgroundColor: AppColors.colorScheme.background
    );
  }
}