import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../Data/Model/index.model.dart';

class ProgramService extends GetxService {
  static ProgramService get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> addProgram(ProgramModel program) async {
    await _db
        .collection("Programs")
        .add(program.toJSON())
        .whenComplete(() => EasyLoading.showSuccess('Success'.tr))
        .catchError((error, stackTrace) {
      EasyLoading.showError('error'.tr);
    });
  }

  Future<ProgramModel> getProgramByDocumentPath(String documentPath) async {
    return ProgramModel.fromSnapshot(await _db.doc(documentPath).get());
  }

  Future<ProgramModel> getProgramByID(String id) async {
    return ProgramModel.fromSnapshot(
        await _db.collection("Programs").doc(id).get());
  }

  Future<List<ProgramModel>> getPrograms(List<String> ids) async {
    return await _db.collection("Programs").where(FieldPath.documentId, whereIn: ids).get().then(
          (querySnapshot) {
            List<ProgramModel> list = [];
            for (var docSnapshot in querySnapshot.docs) {
              list.add(ProgramModel.fromSnapshot(docSnapshot));
            }
            return list;
          },
    );
  }

  Stream<List<ProgramModel>> getProgramsFromUserID(String uid) {
    return _db.collection('Users').doc(uid).snapshots().map((snapshot) => UserModel.fromSnapshot(snapshot).programs)
        .asyncMap((programRefs) async {
          final programSnaps = await Future.wait(programRefs.map((ref)=> _db.collection('Programs').doc(ref).get()));
          return programSnaps.map((e) => ProgramModel.fromSnapshot(e)).toList();
        });
    // _db.collection("Programs").where(FieldPath.documentId, whereIn: ids).get().then(
    //       (querySnapshot) {
    //     List<ProgramModel> list = [];
    //     for (var docSnapshot in querySnapshot.docs) {
    //       list.add(ProgramModel.fromSnapshot(docSnapshot));
    //     }
    //     return list;
    //   },
    // );
  }

  /*Future<void> editProgram(String id) async {
    EasyLoading.showSuccess('editCategory'.tr);
  }

  Future<void> deleteProgram(String id) async {
    EasyLoading.showSuccess('categoryDelete'.tr);
  }*/
}
