import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

import '../../../Shared/index.dart';
import '../../../Shared/Widgets/index.dart';

class LanguagesPage extends GetView<SettingsController> {
  const LanguagesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text('languages'.tr),
        backButton: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: AppPadding.p16h,
              child: TextField(
                onChanged: (value) => controller.filterLanguages(value),
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    value: controller.languages.value[index],
                    groupValue: controller.selectedLanguage.value,
                    onChanged: (val) {
                      if (val != null) {
                        controller.updateLanguage(val);
                      }
                    },
                    title: Text(controller.languages.value[index]),
                  );
                },
                itemCount: controller.languages.value.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
