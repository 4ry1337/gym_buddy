import 'package:get/get.dart';
import 'package:gym_buddy/Service/app.service.dart';
import '../../Data/Model/index.model.dart';
import '../Routes.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  toProfilePage() => Get.toNamed(Routes.profile);
  toProgramPage(ProgramModel programModel) => Get.toNamed(Routes.program, arguments: {
    "programModel": programModel
  });
  toAddProgramPage() => Get.toNamed(Routes.program + Routes.edit, arguments: {
    "programModel": null
  });

  @override
  void onInit() {
    AppService.instance.listenUser();
    AppService.instance.listenPrograms();
    super.onInit();
  }

  @override
  void onClose() {
    AppService.instance.cancelPrograms();
    AppService.instance.cancelUser();
    super.onClose();
  }
}