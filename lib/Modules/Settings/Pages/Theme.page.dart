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
        title: Text('theme'.tr),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RadioListTile(
              value: controller.themes.value[index],
              groupValue: controller.selectedTheme.value,
              onChanged: (val) {
                if (val != null) {
                  controller.changeTheme(val);
                }
              },
              title: Text(controller.themes.value[index]),
            );
          },
          itemCount: controller.themes.value.length,
        ),
      ),
    );
  }
}
