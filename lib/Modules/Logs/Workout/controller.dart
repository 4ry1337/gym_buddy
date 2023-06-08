import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Modules/Routes.dart';

class WorkoutController extends GetxController {
  WorkoutModel? workoutFromArg = Get.arguments["workout"];
  final workoutTitle = TextEditingController();
  final exerciseTitle = TextEditingController();
  RxInt weight = 0.obs;
  RxInt sets = 1.obs;
  RxInt reps = 1.obs;
  RxDouble distance = 0.0.obs;
  //RxDouble time = 0.obs;
  //RxDouble time = 0.obs;
  toAddExercisePage() => Get.toNamed(Get.currentRoute + Routes.exercise);

  final Rx<WorkoutModel> workout = WorkoutModel(
    title: 'new workout',
    exercises: [],
  ).obs;

  @override
  void onInit() async {
    if (workoutFromArg != null) {
      workout.value = workoutFromArg!;
    }
    workoutTitle.text = workout.value.title;
    super.onInit();
  }

  addExercise() {
    workout.update((val) {
      val?.exercises.add(
          ExerciseModel(
            name: 'new exercise',
            exerciseType: ExerciseType.repetition,
          ));
    });
  }

  createWorkout() async {
    workout.update((val) {
      val?.title = workoutTitle.text.trim();
    });
    /*await ProgramService.instance*/
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
}