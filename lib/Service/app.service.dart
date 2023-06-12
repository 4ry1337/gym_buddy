import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Modules/Routes.dart';
import 'package:gym_buddy/Service/index.dart';
import '../Data/Model/index.model.dart';

class AppService extends GetxService {
  static AppService get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  late Rx<UserModel> user;
  late RxList<ProgramModel> programs;
  late RxList<ExerciseModel> exercises;
  late StreamSubscription streamUser;
  late StreamSubscription streamPrograms;
  late StreamSubscription streamExercise;

  User? get firebaseUser => _firebaseUser.value;

  @override
  void onInit() {
    Get.put(UserService());
    Get.put(ProgramService());
    super.onInit();
  }

  @override
  onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(_firebaseUser.value);
    super.onReady();
  }

  setInitialScreen(User? currentUser) async {
    try {
      if (currentUser == null) {
        Get.offAllNamed(Routes.auth);
      } else if (currentUser.isAnonymous || currentUser.emailVerified) {
        user = Rx<UserModel>(
            await UserService.instance.fetchUser(currentUser.uid));
        programs = RxList<ProgramModel>(
            await ProgramService.instance.fetchPrograms(user.value));
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.auth + Routes.verify);
      }
    } on FirebaseAuthException catch (e){
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }


  listenUser() async {
    streamUser = UserService.instance.streamUser(firebaseUser!.uid).listen((userSnap) {
      user.value = UserModel.fromSnapshot(userSnap);
    });
  }

  listenPrograms() async {
    streamPrograms = ProgramService.instance.streamPrograms(firebaseUser!.uid).listen((programSnap) {
      programs.value = List<ProgramModel>.from(programSnap.docs.map((e) => ProgramModel.fromSnapshot(e)) ?? []);
    });
  }

  cancelUser() async {
    streamUser.cancel();
  }

  cancelPrograms() async {
    streamPrograms.cancel();
  }

  /*setExercises(){
    UserService.instance.streamUser(user.value.id).listen((exerciseSnap) {
      exercises.value = List<ExerciseModel>.from(exerciseSnap.docs.map((e)=>ExerciseModel.fromSnapshot(e)) ?? []);
    });
  }*/
}
