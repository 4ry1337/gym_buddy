import 'package:get/get.dart';
import 'package:gym_buddy/Service/index.dart';

import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(HomeController());
  }
}