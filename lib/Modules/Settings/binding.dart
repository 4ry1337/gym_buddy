import 'package:get/get.dart';
import 'controller.dart';


class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }

}