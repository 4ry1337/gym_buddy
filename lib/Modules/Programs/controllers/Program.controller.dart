import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Service/index.dart';
import '../../Routes.dart';

class ProgramController extends GetxController {
  static ProgramController get instance => Get.find();

  toWorkoutPage(WorkoutModel workout)=>Get.toNamed(Routes.program + Routes.workout, arguments: {"workout": workout});
  toAddWorkoutPage()=>Get.toNamed(Routes.program + Routes.workout, arguments: {"workout": null});

  final ProgramModel? programFromArg = Get.arguments['programModel'];

  final Rx<ProgramModel> program = Rx<ProgramModel>(ProgramModel(
      title: 'new program',
      createdBy: AppService.instance.user.value.id,
    ownedBy: AppService.instance.user.value.id,
      workouts: [],
  ));

  final programTitle = TextEditingController();

  @override  void onInit() async {
    if(programFromArg != null){
      program.value = programFromArg!;
    }
    programTitle.text = program.value.title;
    super.onInit();
  }

  @override
  onClose(){
    programTitle.dispose();
    super.onClose();
  }

  createProgram() async {
    program.update((val) {
      val?.title = programTitle.text.trim();
    });
    await ProgramService.instance.createProgram(
        user: AppService.instance.user.value,
        program: program.value
    );
    Get.back();
  }

  updateProgram() async {
    program.update((val) {
      val?.title = programTitle.text.trim();
    });
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
    update();
    Get.offNamedUntil(Routes.home, (Route<dynamic> route) => route.isFirst);
  }

  addWorkout(WorkoutModel workout) async {
    program.update((val) {
      val?.workouts.add(workout);
    });
  }

  updateWorkout(int index, WorkoutModel workout) {
    program.update((val) {
      val?.workouts[index] = workout;
    });
  }

  deleteWorkout(int index) {
    program.update((val) {
      val?.workouts.removeAt(index);
    });
  }

  onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    program.update((val) {
      final WorkoutModel? workoutModel = val?.workouts.removeAt(oldIndex);
      val?.workouts.insert(newIndex, workoutModel!);
    });
  }
}