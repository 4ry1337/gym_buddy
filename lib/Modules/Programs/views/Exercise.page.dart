import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Service/index.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:numberpicker/numberpicker.dart';
import '../index.dart';

class ExercisePage extends GetView<ExerciseController> {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leading: BackButton(),
          actions: [
            IconButton(
              onPressed: () {
                controller.exerciseFromArg != null
                    ? controller.updateExercise()
                    : controller.createExercise();
              },
              icon: Icon(Icons.check),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: AppPadding.p24,
                height: 200,
                child: controller.exerciseFromArg == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'addExercise'.tr,
                            style: AppTypography.h2
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: AppSpacing.s16),
                          Text(
                            'addExerciseQuery'.tr,
                            style: AppTypography.footnote,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'editExercise'.tr,
                            style: AppTypography.h2
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: AppSpacing.s16),
                          Text(
                            'editExerciseQuery'.tr,
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
                    suffixIcon: IconButton(
                      onPressed: controller.exerciseTitle.clear,
                      icon: Icon(Icons.clear),
                    ),
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
                      splashBorderRadius: AppBorderRadius.br16,
                      onTap: (int index) {
                        controller.setExerciseType(index);
                      },
                      controller: controller.tabController,
                      tabs: controller.tabs,
                    ),
                    Divider(height: AppSpacing.s64),
                    SizedBox(
                      height: 875,
                      child: TabBarView(
                          controller: controller.tabController,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                Text(
                                  'sets'.tr,
                                  style: AppTypography.h1,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                Obx(
                                  () => NumberPicker(
                                      axis: Axis.horizontal,
                                      minValue: 0,
                                      maxValue: 10,
                                      decoration: BoxDecoration(
                                          border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  width: 3))),
                                      selectedTextStyle: AppTypography.h3,
                                      itemWidth:
                                          (Get.width - AppSpacing.s32) / 5,
                                      itemCount: 5,
                                      value: controller.sets.value,
                                      onChanged: (value) {
                                        controller.setSets(value);
                                      }),
                                ),
                                Divider(height: AppSpacing.s64),
                                Text(
                                  'reps'.tr,
                                  style: AppTypography.h1,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                Obx(
                                  () => NumberPicker(
                                      axis: Axis.horizontal,
                                      minValue: 0,
                                      maxValue: 20,
                                      decoration: BoxDecoration(
                                          border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  width: 3))),
                                      selectedTextStyle: AppTypography.h3,
                                      itemWidth:
                                          (Get.width - AppSpacing.s32) / 5,
                                      itemCount: 5,
                                      value: controller.reps.value,
                                      onChanged: (value) {
                                        controller.setReps(value);
                                      }),
                                ),
                                Divider(height: AppSpacing.s64),
                                Text(
                                  'weight'.tr,
                                  style: AppTypography.h1,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                AnimatedWeightPicker(
                                  min: 0,
                                  max: 400,
                                  division: 0.5,
                                  //selectedValueColor: Theme.of(context).colorScheme.primary,
                                  selectedValueStyle: AppTypography.h3.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  dialColor:
                                      Theme.of(context).colorScheme.primary,
                                  dialThickness: 3,
                                  showSubIntervalText: true,
                                  squeeze: 2,
                                  suffixText: SettingsService
                                              .getCurrentUnitOfMeasure() ==
                                          UnitsOfMeasure.metric
                                      ? 'kg'.tr
                                      : 'lb'.tr,
                                  suffixTextColor:
                                      Theme.of(context).colorScheme.primary,
                                  onChange: (value) =>
                                      controller.setWeight(value),
                                ),
                                Divider(height: AppSpacing.s64),
                                Text(
                                  'restTime'.tr,
                                  style: AppTypography.h1,
                                ),
                                Text(
                                  'optional'.tr,
                                  style: AppTypography.subtitle,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                CupertinoTimerPicker(
                                    initialTimerDuration: controller.exercise.value.time ?? Duration.zero,
                                    mode: CupertinoTimerPickerMode.ms,
                                    onTimerDurationChanged:
                                        (Duration duration) {
                                      controller.setRestTime(duration);
                                    })
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'time'.tr,
                                  style: AppTypography.h1,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                CupertinoTimerPicker(
                                  initialTimerDuration: controller.exercise.value.time ?? Duration.zero,
                                    mode: CupertinoTimerPickerMode.ms,
                                    onTimerDurationChanged: (Duration duration) {
                                      controller.setTime(duration);
                                    }),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'distance'.tr,
                                  style: AppTypography.h1,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                Obx(
                                  () => NumberPicker(
                                      axis: Axis.horizontal,
                                      minValue: 0,
                                      maxValue: 40,
                                      decoration: BoxDecoration(
                                          border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  width: 3))),
                                      textMapper: (s){
                                        return s + ' ' + (SettingsService.getCurrentUnitOfMeasure() == UnitsOfMeasure.metric ? 'km'.tr : 'mi'.tr);
                                      },
                                      selectedTextStyle: AppTypography.h3,
                                      itemWidth:
                                          (Get.width - AppSpacing.s32) / 5,
                                      itemCount: 5,
                                      value: controller.distance.value.toInt(),
                                      onChanged: (value) {
                                        controller
                                            .setDistance(value.toDouble());
                                      }),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'weight'.tr,
                                  style: AppTypography.h1,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                AnimatedWeightPicker(
                                  min: 0,
                                  max: 400,
                                  division: 0.5,
                                  //selectedValueColor: Theme.of(context).colorScheme.primary,
                                  selectedValueStyle: AppTypography.h3.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  dialColor:
                                  Theme.of(context).colorScheme.primary,
                                  dialThickness: 3,
                                  showSubIntervalText: true,
                                  squeeze: 2,
                                  suffixText: SettingsService
                                      .getCurrentUnitOfMeasure() ==
                                      UnitsOfMeasure.metric
                                      ? 'kg'.tr
                                      : 'lb'.tr,
                                  suffixTextColor:
                                  Theme.of(context).colorScheme.primary,
                                  onChange: (value) =>
                                      controller.setWeight(value),
                                ),
                                Divider(height: AppSpacing.s64),
                                Text(
                                  'restTime'.tr,
                                  style: AppTypography.h1,
                                ),
                                Text(
                                  'optional'.tr,
                                  style: AppTypography.subtitle,
                                ),
                                SizedBox(height: AppSpacing.s8),
                                CupertinoTimerPicker(
                                    initialTimerDuration: controller.exercise.value.time ?? Duration.zero,
                                    mode: CupertinoTimerPickerMode.ms,
                                    onTimerDurationChanged:
                                        (Duration duration) {
                                      controller.setRestTime(duration);
                                    }),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
