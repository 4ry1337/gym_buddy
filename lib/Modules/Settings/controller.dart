import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Modules/Home/controller.dart';
import 'package:gym_buddy/Service/index.dart';
import 'package:gym_buddy/Service/theme.service.dart';
import 'package:gym_buddy/Shared/Config/Theme/Theme.dart';
import 'package:gym_buddy/Shared/Constants/enums.dart';

import '../Routes.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();
  toUnitsPage() => Get.toNamed(Get.currentRoute + Routes.units);
  toGuidePage() => Get.toNamed(Get.currentRoute + Routes.guide);
  toAboutUsPage() => Get.toNamed(Get.currentRoute + Routes.aboutUs);
  toPrivacyPolicyPage() => Get.toNamed(Get.currentRoute + Routes.privacyPolicy);
  toLanguagesPage() => Get.toNamed(Get.currentRoute + Routes.languages);
  toNotificationsPage() => Get.toNamed(Get.currentRoute + Routes.notifications);
  toThemePage() => Get.toNamed(Get.currentRoute + Routes.themes);

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

  //theme
  Rx<String> selectedTheme = SettingsService.getCurrentTheme().obs;

  RxList<String> themes = ThemeService.supportedThemes.keys.toList().obs;

  changeTheme(String themeName) async {
    try {
      selectedTheme.value = themeName;
      await SettingsService.setTheme(themeName);
      Get.changeTheme(ThemeService.supportedThemes[themeName]!.themeData);
      Get.changeThemeMode(ThemeService.supportedThemes[themeName]!.themeMode);
      EasyLoading.showSuccess('themeChanged'.tr);
    } catch(e) {
      EasyLoading.showError('error'.tr);
    }
  }

  //sign out
  Future<void> signOut() async {
    if(AppService.instance.firebaseUser!.isAnonymous){
      await UserService.instance.deleteUser(AppService.instance.user.value);
    }
    await FirebaseAuth.instance.signOut();
    AppService.instance.setInitialScreen(AppService.instance.firebaseUser);
  }

  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e){
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }
}