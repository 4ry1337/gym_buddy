import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Shared/Widgets/index.dart';
import '../../../Shared/index.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        leading: const BackButton(),
        title: Text('privacyPolicy'.tr),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          minimum: AppPadding.p16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'privacyPolicyText'.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
