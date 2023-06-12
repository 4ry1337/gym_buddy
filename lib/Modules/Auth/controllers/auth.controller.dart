import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Service/index.dart';


class AuthController extends GetxController{
  static AuthController get instance => Get.find();

  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassowrd = TextEditingController();

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      AppService.instance.setInitialScreen(userCredential.user);
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  /* Social */
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signUp(String username, String email, String password, String repaetedPassword) async {
    try {
      if(password != repaetedPassword){
        EasyLoading.showError('Passwords dont match');
        return;
      }
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        final user = UserModel(
          id: userCredential.user!.uid,
          username: username,
          email: email,
          createdAt: Timestamp.now(),
        );
        await UserService.instance.createUser(user);
        AppService.instance.setInitialScreen(userCredential.user);
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      final user = UserModel(
        id: userCredential.user!.uid,
        createdAt: Timestamp.now(),
      );
      await UserService.instance.createUser(user);
      AppService.instance.setInitialScreen(userCredential.user);
    } on FirebaseAuthException catch (e){
      EasyLoading.showError(e.message ?? 'Unknown Error');
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e.toString());
    }
  }
}