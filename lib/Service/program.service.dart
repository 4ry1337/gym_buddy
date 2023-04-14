import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../Data/Model/index.model.dart';

class ProgramService extends GetxService{
  static ProgramService get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createProgram(ProgramModel program) async {
    await _db.collection("Programs")
        .add(program.toJSON())
        .whenComplete(() => EasyLoading.showSuccess('Success'.tr))
        .catchError((error, stackTrace){
          EasyLoading.showError('error'.tr);

        });
  }

  Stream<List<ProgramModel>> getPrograms(String uid) {
    return _db.collection("Users").doc(uid).snapshots().map((snapshot){
      final user = UserModel.fromSnapshot(snapshot);
      return user.programs!;
    }).asyncMap((programRefs) async {
      final programSnaps = await Future.wait(programRefs.map((ref) => ref.get()));
      return programSnaps.map((programSnap) {
        return ProgramModel.fromSnapshot(programSnap);
      }).toList();
    });
  }
  // Future<PlanModel?> getPlans(String user_id) async {
  //
  // }
  /*
  Stream<List<Plan>> getPlans() async* {
    yield* isar.plans.where().watch(fireImmediately: true);
  }

  Future<void> addPlan(TextEditingController nameEdit, Function() set) async {
    final createPlan = Plan(
        name: nameEdit.text
    );
    List<Plan> searchPlan;
    final planCollection = isar.plans;

    searchPlan = await planCollection.filter().nameEqualTo(nameEdit.text).findAll();
    if (searchPlan.isEmpty) {
      await isar.writeTxn(() async {
        await isar.plans.put(createPlan);
      });
      EasyLoading.showSuccess('planCreate'.tr);
    } else {
      EasyLoading.showError('duplicatePlan'.tr);
    }

    nameEdit.clear();
    set();
  }

  Future<void> updateCategory(Plan plan, TextEditingController titleEdit, IconData icon, Color selectedColor, Function() set) async {
    await isar.writeTxn(() async {
      plan.name = titleEdit.text;
      await isar.plans.put(plan);
    });
    EasyLoading.showSuccess('editCategory'.tr);
    set();
  }

  Future<void> deleteCategory(Plan plan, Function() set) async {
    // Delete Tasks
    await isar.writeTxn(() async {
      await isar.workouts.filter().plan((q) => q.idEqualTo(plan.id)).deleteAll();
    });
    // Delete Category
    await isar.writeTxn(() async {
      await isar.plans.delete(plan.id);
    });
    EasyLoading.showSuccess('categoryDelete'.tr);
    set();
  }*/
}