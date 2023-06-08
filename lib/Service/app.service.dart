import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Data/Model/index.model.dart';
import '../Modules/Routes.dart';
import 'index.dart';

class AppService extends GetxService {
  static AppService get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  late Rx<UserModel> user;
  late RxList<ProgramModel> programs;
  late RxList<ExerciseModel> exercises;

  User? get firebaseUser => _firebaseUser.value;
  String get firebaseUserID => firebaseUser?.uid ?? '';
  String get firebaseUserEmail => firebaseUser?.email ?? '';
  bool get firebaseUserIsAnonymous => firebaseUser?.isAnonymous ?? true;

  @override
  void onInit() {
    Get.put(AuthService());
    Get.put(UserService());
    Get.put(ProgramService());
    super.onInit();
  }
  @override
  onReady(){
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(_firebaseUser.value);
    super.onReady();
  }

  setInitialScreen(User? currentUser) async {
    if(currentUser == null){
      Get.offAllNamed(Routes.auth);
    } else if (currentUser.isAnonymous || currentUser.emailVerified) {
      user = Rx<UserModel>(await UserService.instance.fetchUser(firebaseUserID));
      programs = RxList<ProgramModel>(await ProgramService.instance.fetchPrograms(user.value));
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.auth + Routes.verify);
    }
  }

  listenUser() async {
    UserService.instance.streamUser(firebaseUserID).listen((userSnap) {
      user.value = UserModel.fromSnapshot(userSnap);
    });
  }

  listenProgram() async {
    ProgramService.instance.streamPrograms(user: user.value).listen((programSnap) {
      programs.value = List<ProgramModel>.from(programSnap.docs.map((e) => ProgramModel.fromSnapshot(e)) ?? []);
    });
  }

  /*setExercises(){
    UserService.instance.streamUser(user.value.id).listen((exerciseSnap) {
      exercises.value = List<ExerciseModel>.from(exerciseSnap.docs.map((e)=>ExerciseModel.fromSnapshot(e)) ?? []);
    });
  }*/
}
