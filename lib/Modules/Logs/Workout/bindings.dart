import 'package:get/get.dart';

import 'controller.dart';

class WorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkoutController());
  }
}