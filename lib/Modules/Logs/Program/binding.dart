import 'package:get/get.dart';

import 'controller.dart';

class ProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgramController());
  }
}