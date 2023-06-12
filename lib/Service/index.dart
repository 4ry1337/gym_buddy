import 'package:get/get.dart';
import 'app.service.dart';
export 'app.service.dart';
export 'user.service.dart';
export 'program.service.dart';
export 'localization.service.dart';
export 'settings.service.dart';
export 'notification.service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppService());
  }
}