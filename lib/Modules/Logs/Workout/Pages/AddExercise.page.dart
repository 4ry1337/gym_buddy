import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
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
                          'addExercise'.tr,
                          style: AppTypography.h2.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: AppSpacing.s16),
                        Text(
                          'addExerciseQuery'.tr,
                          style: AppTypography.footnote,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppPadding.p16h,
                    child: TextFormField(
                      controller: controller.exerciseTitle,
                      decoration: InputDecoration(
                        label: Text('exerciseName'.tr),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.s64),
                  Padding(
                    padding: AppPadding.p16h,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Theme.of(context).colorScheme.onPrimary,
                          indicator: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: AppBorderRadius.br16,
                          ),
                          indicatorColor: Theme.of(context).colorScheme.onPrimary,
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: AppColors.transparent,
                          splashBorderRadius:  AppBorderRadius.br16,
                          tabs: [
                            Tab(text: ExerciseType.repetition.name.tr),
                            Tab(text: ExerciseType.distance.name.tr),
                            Tab(text: ExerciseType.time.name.tr),
                            Tab(text: ExerciseType.weight.name.tr),
                          ],
                        ),
                        Divider(height: AppSpacing.s64),
                        SizedBox(
                          height: 500,
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text('sets'.tr),
                                      SizedBox(height: AppSpacing.s8),
                                      Divider(height: AppSpacing.s64),
                                    ],
                                  ),
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
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
