import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';

import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';

import '../controller.dart';

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
            IconButton(
              onPressed: (){
                controller.programModel != null ? controller.updateProgram() : controller.createProgram();
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
                    textAlign: TextAlign.center,
                    controller: controller.programTitle,
                    decoration: InputDecoration.collapsed(hintText: 'programName'.tr),
                  ),
                ),
              ),
              if(controller.program.value.workouts.isNotEmpty) Obx(()=> ListView.builder(
                shrinkWrap: true,
                itemCount: controller.program.value.workouts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: AppPadding.p0,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: (){
                        controller.toWorkoutPage(controller.program.value.workouts[index]);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.program.value.workouts[index].title,
                            style: AppTypography.h5,
                          ),
                        ],
                      ),
                    ),
                  );
                }, //separatorBuilder: (BuildContext context, int index)=>const SizedBox(height: AppSpacing.s8))
              )),
              Padding(
                padding: AppPadding.p16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: AppPadding.p16
                  ),
                    onPressed: (){
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
