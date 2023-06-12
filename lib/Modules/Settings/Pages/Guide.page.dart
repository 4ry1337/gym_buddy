import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Shared/Widgets/index.dart';
import '../../../Shared/index.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: const BackButton(),
          title: Text('guide'.tr),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.p16,
            child: Column(
              children: [
                Text('guideText'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
