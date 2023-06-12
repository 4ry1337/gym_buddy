import 'package:flutter/material.dart';
import 'package:gym_buddy/Shared/Constants/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization.service.dart';

class SettingsService{
  SettingsService._();

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  static Future<void> clear() async => await _sharedPreferences.clear();

  static const String _currentLanguage = 'current_language';
  static const String _sex = 'sex';
  static const String _unitsOfMeasure = 'unit_of_measure';
  static const String _theme = 'theme';

  static Future<void> setCurrentLanguage(String languageName) => _sharedPreferences.setString(_currentLanguage, languageName);

  static Future<void> setSex(bool sex) => _sharedPreferences.setBool(_sex, sex);

  static Future<void> setUnitOfMeasure(String uom) => _sharedPreferences.setString(_unitsOfMeasure, uom);

  static Future<void> setTheme(String themeName) => _sharedPreferences.setString(_theme, themeName);

  static bool getSex(){
    bool? sex = _sharedPreferences.getBool(_sex);
    return sex ?? sex == null;
  }

  static UnitsOfMeasure getCurrentUnitOfMeasure(){
    String? uom = _sharedPreferences.getString(_unitsOfMeasure);
    if(uom == null){
      return UnitsOfMeasure.metric;
    }
    return UnitsOfMeasure.values.byName(uom);
  }

  static isLanguageSupported(String languageName) => LocalizationService.supportedLanguages.containsKey(languageName);

  static Locale getCurrentLocale(){
    String? langName = _sharedPreferences.getString(_currentLanguage);
    if (langName != null && isLanguageSupported(langName)){
      return LocalizationService.supportedLanguages[langName]!;
    }
    return LocalizationService.defaultLanguage;
  }

  static String getCurrentLanguage(){
    String? langName = _sharedPreferences.getString(_currentLanguage);
    if(langName == null){
      return 'English';
    }
    return langName;
  }

  static String getCurrentTheme() {
    String? themeName = _sharedPreferences.getString(_theme);
    if(themeName == null){
      return 'dark';
    }
    return themeName;
  }
}