import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Service/index.dart';
import 'package:gym_buddy/Shared/Constants/enums.dart';

import '../Routes.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();
  toUnitsPage() => Get.toNamed(Routes.profile + Routes.settings + Routes.units);
  toGuidePage() => Get.toNamed(Routes.profile + Routes.settings + Routes.guide);
  toAboutUsPage() => Get.toNamed(Routes.profile + Routes.settings + Routes.aboutUs);
  toPrivacyPolicyPage() => Get.toNamed(Routes.profile + Routes.settings + Routes.privacyPolicy);
  toLanguagesPage() => Get.toNamed(Routes.profile + Routes.settings + Routes.languages);
  toNotificationsPage() => Get.toNamed(Routes.profile + Routes.settings + Routes.notifications);

  @override
  onInit(){
    super.onInit();
    languages.value = LocalizationService.supportedLanguages.keys.toList();
  }

  //units controls
  Rx<UnitsOfMeasure> selectedUnitOfMeasure = SettingsService.getCurrentUnitOfMeasure().obs;

  final List<UnitsOfMeasure> getUnitsOfMeasure = UnitsOfMeasure.values;

  updateUnitsOfMeasure(UnitsOfMeasure uom) async {
    try {
      await SettingsService.setUnitOfMeasure(uom.name);
      selectedUnitOfMeasure.value = uom;
      EasyLoading.showSuccess('unitsChanged'.tr);
    } catch (e) {
      EasyLoading.showError('error'.tr);
    }
  }

  UnitsOfMeasure getUnitOfMeasure () => SettingsService.getCurrentUnitOfMeasure();

  //language controls
  Rx<String> selectedLanguage = SettingsService.getCurrentLanguage().obs;

  Rx<List<String>> languages = Rx<List<String>>([]);

  void filterLanguages(String query) {
    List<String> results = [];
    if (query.isEmpty) {
      results = LocalizationService.supportedLanguages.keys.toList();
    } else {
      results.add(selectedLanguage.value);
      results.addAll(LocalizationService.supportedLanguages.keys.toList()
          .where((element) => element.toString().toLowerCase().contains(query.toLowerCase())).where((element){
            return element.toString() != selectedLanguage.value;
      }).toList());
    }
    languages.value = results;
  }

  isLanguageSupported(String languageName) => LocalizationService.supportedLanguages.containsKey(languageName);

  updateLanguage(String languageName) async {
    try {
      if (!isLanguageSupported(languageName)) return;
      selectedLanguage.value = languageName;
      await SettingsService.setCurrentLanguage(languageName);
      Get.updateLocale(LocalizationService.supportedLanguages[languageName]!);
      EasyLoading.showSuccess('languageChanged'.tr);
    } catch(e) {
      EasyLoading.showError('error'.tr);
    }
  }

  void signOut(){
    AuthService.instance.signOut();
  }
}