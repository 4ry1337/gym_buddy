import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Data/Model/index.model.dart';
import '../Modules/Routes.dart';
import 'index.dart';

class AppService extends GetxService {
  static AppService get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  late Rx<UserModel> user;
  late RxList<ProgramModel> programs;
  late RxList<ExerciseModel> exercises;

  @override
  void onInit() {
    Get.put(AuthService());
    Get.put(UserService());
    Get.put(ProgramService());
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onInit();
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAllNamed(Routes.auth);
    } else {
      await setUser(user.uid);
      await setPrograms();
      Get.offAllNamed(Routes.home);
    }/* else {
      Get.offAllNamed(Routes.auth + Routes.verify);
    }*/
  }

  setUser(String uid) async {
    user = Rx<UserModel>(await UserService.instance.fetchUser(uid));
    UserService.instance.streamUser(uid).listen((userSnap) {
      user.value = UserModel.fromSnapshot(userSnap);
    });
  }

  setPrograms() async {
    programs = RxList<ProgramModel>(await ProgramService.instance.fetchPrograms(user.value));
    ProgramService.instance.streamPrograms(user: user.value).listen((programSnap) {
      programs.value = List<ProgramModel>.from(programSnap.docs.map((e)=>ProgramModel.fromSnapshot(e)) ?? []);
    });
  }

  /*setExercises(){
    UserService.instance.streamUser(user.value.id).listen((exerciseSnap) {
      exercises.value = List<ExerciseModel>.from(exerciseSnap.docs.map((e)=>ExerciseModel.fromSnapshot(e)) ?? []);
    });
  }*/
}