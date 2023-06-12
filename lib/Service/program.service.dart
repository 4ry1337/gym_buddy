import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../Data/Model/index.model.dart';

class ProgramService extends GetxService {
  static ProgramService get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  fetchProgram({required UserModel user, required String programId}) async {
    return ProgramModel.fromSnapshot(await _db.collection("Users").doc(user.id).collection("Programs").doc(programId).get());
  }

  fetchPrograms(UserModel user) async {
    List<ProgramModel> programs = [];
    await _db.collection("Users").doc(user.id).collection('Programs').orderBy('createdAt', descending: true).get().then(
            (programSnapshots){
              for(var programSnapshot in programSnapshots.docs){
                programs.add(ProgramModel.fromSnapshot(programSnapshot));
              }
            }
    );
    return programs;
  }

  Stream streamPrograms(String uid) {
    return _db.collection("Users").doc(uid).collection("Programs").orderBy('createdAt', descending: true).snapshots();
  }

  createProgram({required UserModel user, required ProgramModel program}) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .collection("Programs")
        .add(program.toJSON())
        .whenComplete(() => EasyLoading.showSuccess('Success'.tr))
        .catchError((error, stackTrace) => EasyLoading.showError('error'.tr));
  }

  deleteProgram({required UserModel user, required ProgramModel program}) async {
    _db.collection("Users").doc(user.id).collection('Programs').doc(program.id).delete()
        .then((doc) => EasyLoading.showSuccess('deleted'.tr),
      onError: (e) {
        print("Error updating document $e");
        EasyLoading.showError('error'.tr);
      },
    );
  }

  updateProgram({required UserModel user, required ProgramModel program}) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .collection("Programs")
        .doc(program.id)
        .update(program.toJSON())
        .whenComplete(() => EasyLoading.showSuccess('Success'.tr))
        .catchError((error, stackTrace) {
      print(error);
      EasyLoading.showError('error'.tr);
    });
  }
}