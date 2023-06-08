import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Shared/Config/Theme/Spacing.dart';
import 'package:gym_buddy/Shared/Config/Theme/Typography.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import '../controller.dart';

class AddExercise extends GetView<WorkoutController> {
  const AddExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: Text(''),
          leading: BackButton(),
        ),
        body: SingleChildScrollView(
          child: DefaultTabController(
              length: ExerciseType.values.length,
              child: Column(
                children: [
                  Container(
                    padding: AppPadding.p24,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AddExercise'.tr,
                          style: AppTypography.h2.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: AppSpacing.s16),
                        Text(
                          'AddExerciseQuery'.tr,
                          style: AppTypography.footnote,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppPadding.p16,
                    child: TextFormField(
                      controller: controller.exerciseTitle,
                      decoration: InputDecoration(
                        label: Text('ExerciseName'.tr),
                      ),
                    ),
                  ),
                  TabBar(
                    tabs: [
                      Tab(text: ExerciseType.repetition.name.tr),
                      Tab(text: ExerciseType.distance.name.tr),
                      Tab(text: ExerciseType.time.name.tr),
                      Tab(text: ExerciseType.weight.name.tr),
                    ],
                  ),
                  Container(
                    padding: AppPadding.p16,
                    height: 450,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                              child: Text(ExerciseType.repetition.name.tr),
                          ),
                          Container(
                              child: Text(ExerciseType.distance.name.tr)
                          ),
                          Container(
                              child: Text(ExerciseType.time.name.tr)
                          ),
                          Container(
                              child: Text(ExerciseType.weight.name.tr)
                          ),
                        ]
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
