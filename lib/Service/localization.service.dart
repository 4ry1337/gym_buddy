import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Shared/index.dart';

class LocalizationService extends Translations {
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService._();
    return _instance!;
  }

  static Locale defaultLanguage = const Locale('en', 'US');

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'english': const Locale('en', 'US'),
    'russian': const Locale('ru', 'RU'),
    'kazakh': const Locale('kk', 'KZ'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'ru_RU': ruRu,
    'kk_KZ': kkKZ,
  };
}

