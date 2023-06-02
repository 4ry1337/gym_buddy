import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Service/index.dart';
import '../../Routes.dart';

class ProgramController extends GetxController {
  static ProgramController get instance => Get.find();

  toEditProgramPage() => Get.toNamed(Routes.program + Routes.edit);
  toWorkoutPage(WorkoutModel workout)=>Get.toNamed(Routes.program + Routes.edit + Routes.workout, arguments: {
    "workout": workout,
  });
  toAddWorkoutPage()=>Get.toNamed(Routes.program + Routes.edit + Routes.workout, arguments: {
    "workout": null,
  });

  final ProgramModel? programModel = Get.arguments['programModel'];

  final Rx<ProgramModel> program = ProgramModel(
      title: 'new program',
      createdBy: AppService.instance.user.value.username,
      workouts: [],
      ownedBy: AppService.instance.user.value.username
  ).obs;

  final programTitle = TextEditingController();

  @override
  void onInit() async {
    if(programModel != null){
      program.value = programModel!;
    }
    programTitle.text = program.value.title;
    super.onInit();
  }

  createProgram() async {
    program.value.title = programTitle.text.trim();
    await ProgramService.instance.createProgram(
        user: AppService.instance.user.value,
        program: program.value
    );
    Get.back();
  }

  updateProgram() async {
    program.value.title = programTitle.text.trim();
    await ProgramService.instance.updateProgram(
        user: AppService.instance.user.value,
        program: program.value
    );
    Get.back();
  }

  deleteProgram() async {
    program.value.title = programTitle.text.trim();
    await ProgramService.instance.deleteProgram(
        user: AppService.instance.user.value,
        program: program.value
    );
    Get.offNamedUntil(Routes.home, (Route<dynamic> route) => route.isFirst);
  }
}