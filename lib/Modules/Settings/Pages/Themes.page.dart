import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Widgets/index.dart';
import '../controller.dart';

class ThemesPage extends GetView<SettingsController> {
  const ThemesPage({Key? key}) : super(key: key);
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
            return Obx(()=>RadioListTile(
              value: controller.themes.value[index],
              groupValue: controller.selectedTheme.value,
              onChanged: (val) {
                if (val != null) {
                  controller.changeTheme(val);
                }
              },
              title: Text(controller.themes.value[index].tr),
            ));
          },
          itemCount: controller.themes.value.length,
        ),
      ),
    );
  }
}
