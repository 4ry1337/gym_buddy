import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';

class WorkoutController extends GetxController {
  WorkoutModel? workoutFromArg = Get.arguments["workout"];

  final Rx<WorkoutModel> workout = WorkoutModel(
      title: 'new workout',
      exercises: [],
  ).obs;

  @override
  void onInit() async {
    if(workoutFromArg != null){
      workout.value = workoutFromArg!;
    }
    print(workout.value.exercises.length);
    super.onInit();
  }
}