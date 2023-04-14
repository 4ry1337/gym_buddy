import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../index.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      pageTransitionsTheme: const PageTransitionsTheme(),
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
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states){
            if(states.contains(MaterialState.pressed)){
              return AppColors.accent;
            }
            return AppColors.white;
          }),
          overlayColor: MaterialStateProperty.all(AppColors.transparent),
          textStyle: MaterialStateProperty.all(AppTypography.body.copyWith(fontWeight: FontWeight.w500)),
          padding: MaterialStateProperty.all(AppPadding.p16),
          elevation: MaterialStateProperty.all(0),
          splashFactory: NoSplash.splashFactory,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          padding: AppPadding.p16,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24),
          elevation: 0,
          backgroundColor: AppColors.dark3,
          foregroundColor: AppColors.white,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: AppPadding.p16,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24),
          textStyle: AppTypography.subtitle.copyWith(fontWeight: FontWeight.w600),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: AppPadding.p16,
            elevation: 0,
            textStyle: AppTypography.subtitle.copyWith(fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24)
        )
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24),
      ),
      colorScheme: AppColors.colorScheme,
      scaffoldBackgroundColor: AppColors.colorScheme.background
    );
  }
}