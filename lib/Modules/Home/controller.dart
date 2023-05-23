import 'package:get/get.dart';
import '../../Data/Model/index.model.dart';
import '../../Service/index.dart';
import '../Routes.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  toProfilePage() => Get.toNamed(Routes.profile);
  toProgramPage() => Get.toNamed(Routes.program);

  Stream<List<ProgramModel>> getPrograms(){
    return ProgramService.instance.getProgramsFromUserID(UserService.instance.currentUser.value.id);
  }
}