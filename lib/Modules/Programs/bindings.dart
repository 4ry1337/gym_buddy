import 'package:get/get.dart';
import 'index.dart';

class WorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkoutController());
  }
}

class ProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgramController());
  }
}

class ExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseController());
  }
}