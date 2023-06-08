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
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: AppPadding.p16h,
          child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'exercies'.tr,
                      style: AppTypography.h4,
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Obx((){
                      if(controller.workout.value.exercises.isNotEmpty){
                        return ListView.separated(
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
                        );
                      }
                      return Container(
                        height: 600,
                        child: Center(
                          child: Text('noExercise'.tr),
                        ),
                      );
                    })
              ]),
        ),
      ),
    );
  }
}
