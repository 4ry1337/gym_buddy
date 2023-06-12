import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';
import '../controller.dart';

class EditWorkoutPage extends GetView<WorkoutController> {
  const EditWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: BackButton(
          onPressed: (){
            Get.back();
          },
        ),
        title: TextField(
          controller: controller.workoutTitle,
          decoration: InputDecoration(
            hintText: 'newWorkout'.tr,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.defaultDialog(
                title: 'deleteWorkout'.tr,
                content: Text(
                  'deleteWorkoutQuery'.tr,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text('cancel'.tr)
                  ),
                  TextButton(
                      onPressed: (){
                        //controller.deleteWorkout();
                      },
                      child: Text('delete'.tr)
                  ),
                ],
              );
            },
            icon: const Icon(Iconsax.trash),
          )
        ],
      ),
      body: SafeArea(
        minimum: AppPadding.p16h,
        child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'exercises'.tr,
                        style: AppTypography.h4,
                      ),
                      IconButton(
                          onPressed: (){
                            controller.toAddExercisePage();
                          },
                          icon: Icon(Iconsax.add)
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  Expanded(
                    child: Obx(() =>ReorderableListView.builder(
                      clipBehavior: Clip.antiAlias,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      buildDefaultDragHandles: true,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          key: Key('$index'),
                          child: InkWell(
                            onLongPress: null,
                            child: Container(
                                padding: AppPadding.p16,
                                height: 100,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(controller.workout.value.exercises[index].name),
                                          IconButton(
                                              onPressed: (){},
                                              icon: Icon(Iconsax.menu)
                                          )
                                        ],
                                      )
                                    ]
                                )
                            ),
                          ),
                        );
                      },
                      itemCount: controller.workout.value.exercises.length,
                      onReorder: (oldIndex, newIndex) {controller.onReorder(oldIndex, newIndex);
                      },
                    )),
                  ),
            ]),
      ),
    );
  }
}
