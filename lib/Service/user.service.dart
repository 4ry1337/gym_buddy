import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Data/Model/index.model.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  late Rx<UserModel> currentUser;

  setUser(String uid) async {
    var userRef = _db.collection("Users").doc(uid);
    currentUser = UserModel.fromSnapshot(await userRef.get()).obs;
    userRef.snapshots().listen((event) {
      currentUser.value = UserModel.fromSnapshot(event);
    });
    print("User Initialized");
  }

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .set(user.toJSON())
        .whenComplete(() => EasyLoading.showSuccess('Success'.tr))
        .catchError((error, stackTrace) => EasyLoading.showError('error'.tr));
  }

  updateUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .update(user.toJSON())
        .whenComplete(() => EasyLoading.showSuccess('Success'.tr))
        .catchError((error, stackTrace) => EasyLoading.showError('error'.tr));
  }

  getUserDetails(uid) async {
    return UserModel.fromSnapshot(await _db.collection("Users").doc(uid).get());
  }
}
