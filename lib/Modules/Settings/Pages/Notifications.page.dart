import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Config/Theme/Spacing.dart';
import '../controller.dart';

import '../../../Shared/Widgets/index.dart';

class NotificationsPage extends GetView<SettingsController> {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text('notifications'.tr),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: AppPadding.p16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('notifications'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
