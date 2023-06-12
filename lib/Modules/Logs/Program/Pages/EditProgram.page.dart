import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Modules/Logs/Program/controller.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';

class EditProgramPage extends GetView<ProgramController> {
  const EditProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: BackButton(
          onPressed: (){
            // discardChangesAndGoBack();
            Get.back();
          },
        ),
        title: TextField(
          controller: controller.programTitle,
          decoration: InputDecoration(
            label: Text('programName'.tr),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.defaultDialog(
                title: 'deleteProgram'.tr,
                content: Text(
                  'deleteProgramQuery'.tr,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text('cancel'.tr)
                  ),
                  TextButton(
                      onPressed: (){
                        controller.deleteProgram();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: AppPadding.p16h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'workouts'.tr,
                        style: AppTypography.h4,
                      ),
                      IconButton(
                          onPressed: (){
                            controller.toAddWorkoutPage();
                          },
                          icon: Icon(Iconsax.add)
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: AppPadding.p16,
                child: controller.program.value.workouts.isEmpty ?
                Center(
                  child: Text('noWorkouts'.tr),
                ) : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Obx(()=> ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.program.value.workouts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            customBorder:
                            Theme.of(context).cardTheme.shape,
                            onTap: () {
                              controller.toWorkoutPage(controller.program.value.workouts[index]);
                            },
                            child: Container(
                                height: 100,
                                padding: AppPadding.p8,
                                child: Center(
                                  child:
                                  Text(controller.program.value.workouts[index].title),
                                )),
                          ),
                        );
                      })
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
