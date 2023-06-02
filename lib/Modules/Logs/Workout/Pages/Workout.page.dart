import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import '../controller.dart';

class WorkoutPage extends GetView<WorkoutController> {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text('Workout'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppPadding.p16,
              child: Text(
                'exercies'.tr,
                style: AppTypography.h4,
              ),
            ),
            Expanded(
                child: controller.workout.value.exercises.isNotEmpty ?
                Obx(() => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.workout.value.exercises.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: AppPadding.p0,
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                            width: 200,
                            padding: AppPadding.p8,
                            child: Column(
                                children: [
                                  Text(controller.workout.value.exercises[index].name),
                                  Text(controller.workout.value.exercises[index].exerciseType.name),
                                ]
                            )
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: AppSpacing.s8)
                )) : Center(
                    child: Text('noExercise'.tr)
                ),
            )
          ]
        ),
      ),
    );
  }
}
