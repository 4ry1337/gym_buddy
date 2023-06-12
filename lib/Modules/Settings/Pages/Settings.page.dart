import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gym_buddy/Shared/Config/Theme/Spacing.dart';
import 'package:gym_buddy/Shared/index.dart';
import '../controller.dart';

import '../../../Shared/Widgets/index.dart';
import '../Widgets/SettingsSections.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text('settings'.tr),
        leading: const BackButton(),
      ),
      body: SafeArea(
        minimum: AppPadding.p24h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingsSection(title: 'common'.tr, actions: [
                TextButton(
                  onPressed: () {
                    controller.toNotificationsPage();
                  },
                  child: Row(
                    children: [
                      Text('notifications'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.toUnitsPage();
                  },
                  child: Row(
                    children: [
                      Text('unitsOfMeasure'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.toLanguagesPage();
                  },
                  child: Row(
                    children: [
                      Text('languages'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.toThemePage();
                  },
                  child: Row(
                    children: [
                      Text('themes'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: AppSpacing.s24),
              SettingsSection(title: 'help'.tr, actions: [
                TextButton(
                  onPressed: () {
                    controller.toGuidePage();
                  },
                  child: Row(
                    children: [
                      Text('guide'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.toPrivacyPolicyPage();
                  },
                  child: Row(
                    children: [
                      Text('privacyPolicy'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.toAboutUsPage();
                  },
                  child: Row(
                    children: [
                      Text('aboutUs'.tr),
                      const Spacer(),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: AppSpacing.s24),
              OutlinedButton(
                  onPressed: (){
                    controller.signOut();
                  },
                  child: Text('signOut'.tr)
              )
            ],
          ),
        ),
      ),
    );
  }
}
