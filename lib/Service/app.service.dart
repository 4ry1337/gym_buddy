import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Modules/Routes.dart';
import 'index.dart';

class AppService extends GetxService {
  static AppService get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Get.put(AuthService());
    Get.put(UserService());
    Get.put(ProgramService());
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      await UserService.instance.setLocalUser(user.uid);
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.auth);
    }
  }
}