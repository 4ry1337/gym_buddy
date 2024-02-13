import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/exercise.model.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import '../index.dart';

class ProgramPage extends GetView<ProgramController> {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: BackButton(),
          actions: [
            if(controller.programFromArg != null) IconButton(
              onPressed: () {
                controller.deleteProgram();
              },
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                controller.programFromArg != null
                    ? controller.updateProgram()
                    : controller.createProgram();
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
                    controller: controller.programTitle,
                    decoration: InputDecoration(
                      labelText: 'programName'.tr,
                      labelStyle: AppTypography.subtitle.copyWith(color: Theme.of(context).colorScheme.primary)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.p16h,
                child: Obx(() => ReorderableListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.program.value.workouts.length,
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
                                    controller.deleteWorkout(index);
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
                              onTap: () {
                                controller.toWorkoutPage(
                                    controller.program.value.workouts[index]);
                              },
                              child: Container(
                                padding: AppPadding.p24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      controller.program.value.workouts[index].title,
                                      style: AppTypography.h5,
                                    ),
                                    SizedBox(height: AppSpacing.s16),
                                    ListView.separated(
                                      padding: AppPadding.p0,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: controller.program.value.workouts[index].exercises.length,
                                      itemBuilder: (context, i) {
                                        if(controller.program.value.workouts[index].exercises[i].exerciseType == ExerciseType.repetition){
                                          return Row(
                                            children: [
                                              Text(
                                                controller.program.value
                                                    .workouts[index].exercises[i]
                                                    .title,
                                                style: AppTypography.body,
                                              ),
                                              Spacer(),
                                              Text.rich(
                                                TextSpan(
                                                  text: '${controller.program.value.workouts[index].exercises[i].sets}',
                                                  children: [
                                                    TextSpan(
                                                      text: 'x',
                                                    ),
                                                    TextSpan(
                                                      text: '${controller.program.value.workouts[index].exercises[i].reps}',
                                                    ),
                                                  ]
                                                ),
                                                style: AppTypography.body,
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                      separatorBuilder: (context, i) => SizedBox(height: AppSpacing.s8),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      onReorder: (int oldIndex, int newIndex) {
                        controller.onReorder(oldIndex, newIndex);
                      },
                    )),
              ),
              Padding(
                padding: AppPadding.p16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: AppPadding.p16),
                  onPressed: () {
                    controller.toAddWorkoutPage();
                  },
                  child: Text(
                    'addWorkout'.tr,
                    style: AppTypography.body,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
