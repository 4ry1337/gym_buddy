import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Modules/Routes.dart';
import 'package:gym_buddy/Service/index.dart';

class VerificationController extends GetxController{
  static VerificationController get instance => Get.find();
  void toAuth() => Get.offAllNamed(Routes.auth);

  late Timer _timer;

  @override
  onInit(){
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }
  Future<void> sendVerificationEmail() async {
    try {
      await AuthService.instance.sendVerificationEmail();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> manuallyCheckEmailVerificationStatus() async {
    Get.offAllNamed(Routes.home);
  }

  Future<void> setTimerForAutoRedirect() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if(AppService.instance.firebaseUser.value!.emailVerified){
        timer.cancel();
      }
    });
  }

}