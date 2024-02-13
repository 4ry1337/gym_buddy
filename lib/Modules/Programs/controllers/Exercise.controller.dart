import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Modules/Programs/controllers/Workout.controller.dart';
import 'package:gym_buddy/Modules/Routes.dart';
import 'package:gym_buddy/Service/app.service.dart';

class ExerciseController extends GetxController with GetSingleTickerProviderStateMixin {
  static ExerciseController get instance => Get.find();
  late TabController tabController;
  ExerciseModel? exerciseFromArg = Get.arguments["exercise"];
  int? index = Get.arguments["index"];

  @override
  void onInit() async {
    if (exerciseFromArg != null) {
      exercise.value = exerciseFromArg!;
    }
    exerciseTitle.text = exercise.value.title;
    exerciseType.value = exercise.value.exerciseType;
    if(exercise.value.weight != null){
      setWeight(exercise.value.weight!);
    }
    if(exercise.value.sets != null){
      setSets(exercise.value.sets!);
    }
    if(exercise.value.reps != null){
      setReps(exercise.value.reps!);
    }
    if(exercise.value.distance != null){
      setDistance(exercise.value.distance!);
    }
    if(exercise.value.time != null){
      setTime(exercise.value.time!);
    }
    if(exercise.value.restTime != null){
      setRestTime(exercise.value.restTime!);
    }
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.animateTo(ExerciseType.values.indexOf(exercise.value.exerciseType));
  }

  final List<Tab> tabs = <Tab>[
    Tab(text: ExerciseType.values[0].name.tr),
    Tab(text: ExerciseType.values[1].name.tr),
    Tab(text: ExerciseType.values[2].name.tr),
    Tab(text: ExerciseType.values[3].name.tr),
  ];

  final exerciseTitle = TextEditingController();
  Rx<ExerciseType> exerciseType = ExerciseType.repetition.obs;
  RxString weight = '0.0'.obs;
  RxInt sets = 3.obs;
  RxInt reps = 1.obs;
  RxDouble distance = 0.0.obs;
  Rx<Duration> time = Duration.zero.obs;
  Rx<Duration> restTime = Duration.zero.obs;

  setExerciseType(int index) {
    exerciseType.value = ExerciseType.values[index];
  }

  setSets(int value) {
    sets.value = value;
  }

  setReps(int value) {
    reps.value = value;
  }

  setWeight(String value) {
    weight.value = value;
  }

  setDistance(double value) {
    distance.value = value;
  }

  setTime(Duration value) {
    time.value = value;
  }

  setRestTime(Duration value) {
    restTime.value = value;
  }

  toAddExercisePage() => Get.toNamed(Get.currentRoute + Routes.exercise);

  final Rx<ExerciseModel> exercise = ExerciseModel(
    title: 'new exercise',
    exerciseType: ExerciseType.repetition,
    createdBy: AppService.instance.user.value.id,
    ownedBy: AppService.instance.user.value.id,
  ).obs;

  updateExercise() {
    try {
      if(index != null){
        exercise.update((val) {
          val?.title = exerciseTitle.text;
          val?.weight = weight.value;
          val?.exerciseType = exerciseType.value;
          val?.sets = sets.value;
          val?.reps = reps.value;
          val?.distance = distance.value;
          val?.time = time.value;
          val?.restTime = restTime.value;
        });
        WorkoutController.instance.updateExercise(index!, exercise.value);
        EasyLoading.showSuccess('success'.tr);
        Get.back();
      }
    } catch (e) {
      EasyLoading.showError('error'.tr);
      throw Exception(e.toString());
    }
  }

  createExercise() {
    exercise.update((val) {
      val?.title = exerciseTitle.text;
      val?.weight = weight.value;
      val?.exerciseType = exerciseType.value;
      val?.sets = sets.value;
      val?.reps = reps.value;
      val?.distance = distance.value;
      val?.time = time.value;
      val?.restTime = restTime.value;
    });
    WorkoutController.instance.addExercise(exercise.value);
    EasyLoading.showSuccess('success'.tr);
    Get.back();
  }

  @override
  void onClose() {
    exerciseTitle.dispose();
    tabController.dispose();
    super.onClose();
  }
}