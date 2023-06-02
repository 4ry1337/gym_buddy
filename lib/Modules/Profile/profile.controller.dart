import 'package:get/get.dart';
import '../Routes.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  toEdiProfilePage() => Get.toNamed(Routes.profile + Routes.edit);
  toSettingsPage() => Get.toNamed(Routes.profile + Routes.settings);
}