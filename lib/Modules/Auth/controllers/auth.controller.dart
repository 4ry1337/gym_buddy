import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../Data/Model/index.model.dart';
import '../../../Service/index.dart';


class AuthController extends GetxController{
  static AuthController get instance => Get.find();

  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassowrd = TextEditingController();

  Future<void> signIn(String email, String password) async {
    AuthService.instance.signIn(email, password);
    AppService.instance.setInitialScreen(AppService.instance.firebaseUser);
  }

  Future<void> signUp(String username, String email, String password, String repaetedPassword) async {
    if(password != repaetedPassword){
      EasyLoading.showError('Passwords dont match');
      return;
    }
    await AuthService.instance.signUp(email, password);
    final user = UserModel(
      id: AppService.instance.firebaseUserID,
      username: username,
      email: email,
      createdAt: Timestamp.now(),
    );
    await UserService.instance.createUser(user);
    AppService.instance.setInitialScreen(AppService.instance.firebaseUser);
  }

  Future<void> signUpGuest() async {
    await AuthService.instance.signInAnonymously();
    final user = UserModel(
      id: AppService.instance.firebaseUserID,
      createdAt: Timestamp.now(),
    );
    await UserService.instance.createUser(user);
    AppService.instance.setInitialScreen(AppService.instance.firebaseUser);
  }
}