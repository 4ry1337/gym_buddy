import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Data/Model/index.model.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  fetchUser(uid) async {
    var userRef = _db.collection("Users").doc(uid);
    return UserModel.fromSnapshot(await userRef.get());
  }

  fetchUsers() async {
    List<UserModel> users = [];
    _db.collection("Users").get().then(
        (userSnap){
          for(var userSnap in userSnap.docs){
            users.add(UserModel.fromSnapshot(userSnap));
          }
        }
    );
    return users;
  }

  Stream streamUser(uid){
    return _db.collection("Users").doc(uid).snapshots();
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
        .catchError((error, stackTrace) {
          print(error);
          EasyLoading.showError('error'.tr);
    });
  }

  deleteUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .delete();
  }
}
