import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Shared/index.dart';

class ThemeModel {
  ThemeModel(
    this.themeData,
    this.themeMode
  );
  ThemeData themeData;
  ThemeMode themeMode;
}

class ThemeService extends GetxService{
  static ThemeService get instance => Get.find();

  static Map<String, ThemeModel> supportedThemes = {
    'system': ThemeModel(AppTheme.lightTheme, ThemeMode.system),
    'light': ThemeModel(AppTheme.lightTheme, ThemeMode.light),
    'dark': ThemeModel(AppTheme.darkTheme, ThemeMode.dark),
    'pink': ThemeModel(AppTheme.pinkTheme, ThemeMode.light),
  };
}

