import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gym_buddy/Shared/Config/Theme/Spacing.dart';
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
        backButton: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SettingsSection(title: 'common'.tr, actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: AppPadding.p24h
                        ),
                        onPressed: () {
                          controller.toNotificationsPage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('notifications'.tr),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: AppPadding.p24h
                        ),
                        onPressed: () {
                          controller.toUnitsPage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('unitsOfMeasure'.tr),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: AppPadding.p24h
                        ),
                        onPressed: () {
                          controller.toLanguagesPage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('languages'.tr),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ]),
                    const SizedBox(height: AppSpacing.s24),
                    SettingsSection(title: 'help'.tr, actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: AppPadding.p24h
                        ),
                        onPressed: () {
                          controller.toGuidePage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('guide'.tr),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: AppPadding.p24h
                        ),
                        onPressed: () {
                          controller.toPrivacyPolicyPage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('privacyPolicy'.tr),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: AppPadding.p24h
                        ),
                        onPressed: () {
                          controller.toAboutUsPage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('aboutUs'.tr),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: AppPadding.p24,
              child: OutlinedButton(
                  onPressed: (){
                    controller.signOut();
                  },
                  child: Text('logOut'.tr)
              ),
            )
          ],
        ),
      ),
    );
  }
}
