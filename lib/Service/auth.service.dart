import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  /*email*/
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  /*anonymous*/
  Future<void> signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e){
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  /*sign out*/
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> delete() async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e){
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }
}