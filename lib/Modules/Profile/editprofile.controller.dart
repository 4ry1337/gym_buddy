import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/Model/index.model.dart';
import '../../Service/index.dart';
import '../Home/controller.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  final username = TextEditingController();

  Rx<UserModel> userData = AppService.instance.user;

  @override
  onInit(){
    username.text = userData.value.username ?? '';
    super.onInit();
  }

  editUser() async {
    var newUserData = userData.value;
    newUserData.username = username.text.trim();
    await UserService.instance.updateUser(newUserData);
    Get.back();
  }

  @override
  void onClose() {
    username.dispose();
    super.onClose();
  }
}