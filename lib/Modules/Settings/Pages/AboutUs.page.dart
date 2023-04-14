import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Config/Theme/Spacing.dart';

import '../../../Shared/Widgets/index.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: true,
        title: Text('aboutUs'.tr),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.p16,
            child: Column(
              children: const [
                Placeholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
