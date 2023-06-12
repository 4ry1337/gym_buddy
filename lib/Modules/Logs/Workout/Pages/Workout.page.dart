import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import '../controller.dart';

class WorkoutPage extends GetView<WorkoutController> {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(
          leading: BackButton(),
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
                    textAlign: TextAlign.center,
                    controller: controller.exerciseTitle,
                    decoration: InputDecoration.collapsed(hintText: 'exerciseName'.tr),
                  ),
                ),
              ),
              if(controller.workout.value.exercises.isNotEmpty) Obx(() => ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.workout.value.exercises.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: AppPadding.p0,
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                          padding: AppPadding.p8,
                          child: Column(children: [
                            Text(controller.workout.value.exercises[index].name),
                            Text(controller.workout.value.exercises[index].exerciseType.name),
                          ])
                      ),
                    );
                    },
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: AppSpacing.s8)
              )),
              Padding(
                padding: AppPadding.p16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: AppPadding.p16
                  ),
                  onPressed: (){
                    controller.toAddExercisePage();
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
