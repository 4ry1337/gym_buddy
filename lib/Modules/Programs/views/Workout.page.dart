import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/exercise.model.dart';
import 'package:gym_buddy/Service/index.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import '../index.dart';

class WorkoutPage extends GetView<WorkoutController> {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: BackButton(),
          actions: [
            IconButton(
              onPressed: () {
                controller.workoutFromArg != null
                    ? controller.updateWorkout()
                    : controller.createWorkout();
              },
              icon: Icon(Icons.check),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: AppPadding.p24,
                height: 200,
                child: Center(
                  child: TextField(
                    controller: controller.workoutTitle,
                    decoration: InputDecoration(
                      labelText: 'workoutName'.tr,
                      labelStyle: AppTypography.subtitle.copyWith(color: Theme.of(context).colorScheme.primary)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.p16h,
                child: Obx(() =>
                    ReorderableListView.builder(
                      onReorder: (int oldIndex, int newIndex) {
                        controller.onReorder(oldIndex, newIndex);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.workout.value.exercises.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: Key('$index'),
                          clipBehavior: Clip.hardEdge,
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.deleteExercise(index);
                                  },
                                  backgroundColor:
                                      Theme.of(context).colorScheme.error,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onError,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: (){
                                controller.toExercisePage(index, controller.workout.value.exercises[index]);
                              },
                              child: Container(
                                  padding: AppPadding.p24,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${index + 1}',
                                            style: AppTypography.h3,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: AppSpacing.s8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  controller.workout.value
                                                      .exercises[index].title,
                                                  style: AppTypography.h3,
                                                ),
                                                Spacer(),
                                                Text(controller
                                                    .workout
                                                    .value
                                                    .exercises[index]
                                                    .exerciseType
                                                    .name,
                                                  style: AppTypography.body,
                                                ),
                                              ],
                                            ),
                                            if(controller.workout.value.exercises[index].exerciseType == ExerciseType.repetition) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '${controller.workout.value.exercises[index].sets}',
                                                    style: AppTypography.body,
                                                  ),
                                                  Text(
                                                    'x',
                                                    style: AppTypography.body,
                                                  ),
                                                  Text(
                                                    '${controller.workout.value.exercises[index].reps}',
                                                    style: AppTypography.body,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '${controller.workout.value.exercises[index].weight ?? ''}' + ' ' + (SettingsService.getCurrentUnitOfMeasure() ==UnitsOfMeasure.metric? 'kg'.tr: 'lb'.tr),
                                                    style: AppTypography.body,
                                                  ),
                                                  if(controller.workout.value.exercises[index].restTime != Duration.zero) ...[
                                                    Spacer(),
                                                    Text(
                                                      'restTime'.tr + ': ${controller.workout.value.exercises[index].restTime?.inMinutes}:${controller.workout.value.exercises[index].restTime?.inSeconds}',
                                                      style: AppTypography.body,
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ],
                                            if(controller.workout.value.exercises[index].exerciseType == ExerciseType.time) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '${controller.workout.value.exercises[index].time?.inMinutes}:${controller.workout.value.exercises[index].time?.inSeconds}',
                                                    style: AppTypography.body,
                                                  ),
                                                ],
                                              ),
                                            ],
                                            if(controller.workout.value.exercises[index].exerciseType == ExerciseType.distance) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '${controller.workout.value.exercises[index].distance}' + ' ' + (SettingsService.getCurrentUnitOfMeasure() ==UnitsOfMeasure.metric? 'km'.tr: 'mi'.tr),
                                                    style: AppTypography.body,
                                                  ),
                                                ],
                                              ),
                                            ],
                                            if(controller.workout.value.exercises[index].exerciseType == ExerciseType.weight) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '${controller.workout.value.exercises[index].weight}' + ' ' + (SettingsService.getCurrentUnitOfMeasure() ==UnitsOfMeasure.metric? 'kg'.tr: 'lb'.tr),
                                                    style: AppTypography.body,
                                                  ),
                                                  if(controller.workout.value.exercises[index].restTime != Duration.zero) ...[
                                                    Spacer(),
                                                    Text(
                                                      'restTime'.tr + ': ${controller.workout.value.exercises[index].restTime?.inMinutes}:${controller.workout.value.exercises[index].restTime?.inSeconds}',
                                                      style: AppTypography.body,
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    )),
              ),
              Padding(
                padding: AppPadding.p16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: AppPadding.p16),
                  onPressed: () {
                    controller.toAddExercisePage();
                  },
                  child: Text(
                    'addExercise'.tr,
                    style: AppTypography.body,
                  ),
                ),
              ),
              /*Padding(
                padding: AppPadding.p16,
                child: Column(
                  children: [
                    Text(
                      'restTime'.tr,
                      style: AppTypography.h5,
                    ),
                    Text(
                      'optional'.tr,
                      style: AppTypography.subtitle,
                    ),
                    Text(
                      'setRestTimeBetweenExercises'.tr,
                      style: AppTypography.subtitle,
                    ),
                    SizedBox(height: AppSpacing.s8),
                    CupertinoTimerPicker(
                        initialTimerDuration: controller.workout.value.restTime ?? Duration.zero,
                        mode: CupertinoTimerPickerMode.ms,
                        onTimerDurationChanged:
                            (Duration duration) {
                          controller.setRestTime(duration);
                        }),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
