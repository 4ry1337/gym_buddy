import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
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
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> manuallyCheckEmailVerificationStatus() async {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      AppService.instance.setInitialScreen(user);
    }
  }

  Future<void> setTimerForAutoRedirect() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        AppService.instance.setInitialScreen(user);
      }
    });
  }

}