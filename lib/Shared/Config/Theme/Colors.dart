import 'package:flutter/material.dart';

class AppColors {
    static const Color transparent = Color(0x00000000);
    static const Color white = Color(0xffffffff);
    static const Color black = Color(0xff000000);
    static const Color accent = Color(0xffD0FD3E);
    static const Color dark1 = Color(0xff1C1C1E);
    static const Color dark2 = Color(0xff2C2C2E);
    static const Color dark3 = Color(0xff3A3A3C);
    static const Color gray = Color(0xff505050);
    static const Color error = Color(0xffFF2D55);
    static const Color success = Color(0xff34C759);
    static const ColorScheme colorScheme = ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.accent,
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
    );
}

