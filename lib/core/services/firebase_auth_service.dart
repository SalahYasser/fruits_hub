import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;

    } on FirebaseAuthException catch (e) {

      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code.toString()} ');

      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'الاتصال بالانترنت غير متوفر');
      } else {
        throw CustomExceptions(message: 'يوجد خطأ, حاول مرة أخرى');
      }

    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomExceptions(message: 'يوجد خطأ, حاول مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credential.user!;

    } on FirebaseAuthException catch (e) {

      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code.toString()} ');

      if (e.code == 'user-not-found') {
        throw CustomExceptions(
            message: 'البريد الإلكتروني او كلمة المرور غير صحيح');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(
            message: 'البريد الإلكتروني او كلمة المرور غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'الاتصال بالانترنت غير متوفر');
      } else {
        throw CustomExceptions(message: 'يوجد خطأ, حاول مرة أخرى');
      }

    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomExceptions(message: 'يوجد خطأ, حاول مرة أخرى');
    }
  }

  Future<User> signInWithGoogle() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
