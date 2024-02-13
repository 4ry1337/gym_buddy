import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  toAddProgramPage() => Get.toNamed(Routes.program, arguments: {
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

  start() {
    try {
      if(AppService.instance.user.value.currentProgramId == null){

      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }
}