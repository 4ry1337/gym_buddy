import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      print('FIREBASE AUTH EXCEPTION - ${e.message}');
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      print('FIREBASE AUTH EXCEPTION - ${e.message}');
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> signOut() async => await _auth.signOut();
}