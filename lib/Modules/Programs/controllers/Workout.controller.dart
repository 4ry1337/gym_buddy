import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Modules/Programs/controllers/Program.controller.dart';
import 'package:gym_buddy/Modules/Routes.dart';
import 'package:gym_buddy/Service/index.dart';

class WorkoutController extends GetxController {
  static WorkoutController get instance => Get.find();
  WorkoutModel? workoutFromArg = Get.arguments["workout"];
  final workoutTitle = TextEditingController();
  Rx<Duration> restTime = Duration(minutes: 2).obs;

  toExercisePage(int index, ExerciseModel exercise) =>
      Get.toNamed(Get.currentRoute + Routes.exercise,
          arguments: {
        "exercise": exercise, "index": index,
      });
  toAddExercisePage() => Get.toNamed(Get.currentRoute + Routes.exercise,
      arguments: {"exercise": null});

  final Rx<WorkoutModel> workout = WorkoutModel(
    title: 'new workout',
    exercises: [],
    createdBy: AppService.instance.user.value.id,
    ownedBy: AppService.instance.user.value.id,
  ).obs;

  @override
  void onInit() async {
    if (workoutFromArg != null) {
      workout.value = workoutFromArg!;
    }
    workoutTitle.text = workout.value.title;
    super.onInit();
  }

  setRestTime(Duration value) {
    restTime.value = value;
  }

  addExercise(ExerciseModel exercise) {
    workout.update((val) {
      val?.exercises.add(exercise);
    });
  }

  updateExercise(int index, ExerciseModel exercise) {
    workout.update((val) {
      val?.exercises[index] = exercise;
    });
  }

  onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    workout.update((val) {
      final ExerciseModel? exercise = val?.exercises.removeAt(oldIndex);
      val?.exercises.insert(newIndex, exercise!);
    });
  }

  updateWorkout() {
    workout.update((val) {
      val?.title = workoutTitle.text;
      //val?.restTime = restTime.value;
    });
    ProgramController.instance.updateWorkout(0, workout.value);
    Get.back();
  }

  createWorkout() {
    workout.update((val) {
      val?.title = workoutTitle.text;
      //val?.restTime = restTime.value;
    });
    ProgramController.instance.addWorkout(workout.value);
    EasyLoading.showSuccess('success'.tr);
    Get.back();
  }

  deleteExercise(int index) {
    workout.update((val) {
      val?.title = workoutTitle.text;
      val?.exercises.removeAt(index);
    });
  }
}
