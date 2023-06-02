import 'package:flutter/material.dart';
import 'package:get/get.dart';

void discardChangesAndGoBack() {
  Get.defaultDialog(
    title: 'discardChanges'.tr,
    content: Text(
      'discardChangesQuery'.tr,
    ),
    actions: [
      TextButton(
          onPressed: () => Get.back(),
          child: Text('cancel'.tr)
      ),
      TextButton(
          onPressed: (){
            Get.back(closeOverlays: true);
          },
          child: Text('discard'.tr)
      ),
    ],
  );
}