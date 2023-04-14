import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';

import 'package:gym_buddy/Shared/index.dart';

import '../controller.dart';

class ProgramPage extends GetView<ProgramController> {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.accent,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.background.withOpacity(0),
              ],
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: TextButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextFormField(
          controller: controller.programTitle,
          decoration: const InputDecoration(
            hintText: 'New Program',
          ),
        ),
      ),
      body: SafeArea(
        minimum: AppPadding.p24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Placeholder(),
                /*child: StreamBuilder<List<WorkoutModel>>(
                  stream: controller.workouts,
                  builder: (context, AsyncSnapshot<List<WorkoutModel>> listData){
                    switch
                  },
                )*/
            ),
            const SizedBox(height: AppSpacing.s16),
            FilledButton(
                onPressed: (){},
                child: Text('Create'.tr),
            )
          ],
        ),
      ),
    );
  }
}
