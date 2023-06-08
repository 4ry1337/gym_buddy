import 'package:get/get.dart';
import 'package:gym_buddy/Service/app.service.dart';
import '../../Data/Model/index.model.dart';
import '../Routes.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  @override
  onReady() {
    AppService.instance.listenUser();
    AppService.instance.listenProgram();
    super.onReady();
  }
  toProfilePage() => Get.toNamed(Routes.profile);
  toProgramPage(ProgramModel programModel) => Get.toNamed(Routes.program, arguments: {
    "programModel": programModel
  });
  toAddProgramPage() => Get.toNamed(Routes.program + Routes.edit, arguments: {
    "programModel": null
  });
}