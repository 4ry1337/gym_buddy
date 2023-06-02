import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

import '../../../Shared/Widgets/index.dart';
import '../Widgets/SettingsSections.dart';

class UnitsPage extends GetView<SettingsController> {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text('units'.tr),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsSection(actions: [
                Obx(() => RadioListTile(
                      title: Text('metric'.tr),
                      value: controller.getUnitsOfMeasure[0],
                      groupValue: controller.selectedUnitOfMeasure.value,
                      onChanged: (val) {
                        if (val != null) {
                          controller.updateUnitsOfMeasure(val);
                        }
                      },
                    )),
                Obx(() => RadioListTile(
                      title: Text('imperial'.tr),
                      value: controller.getUnitsOfMeasure[1],
                      groupValue: controller.selectedUnitOfMeasure.value,
                      onChanged: (val) {
                        if (val != null) {
                          controller.updateUnitsOfMeasure(val);
                        }
                      },
                    )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
