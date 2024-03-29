import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
import 'package:gym_buddy/Shared/Widgets/index.dart';

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
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
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
          ],
        ),
      ),
    );
  }
}
