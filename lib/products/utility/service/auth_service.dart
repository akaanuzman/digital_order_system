import 'package:digital_order_system/products/utility/service/error_handler_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthService {
  final ErrorHandlerService errorHandlerService = ErrorHandlerService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      errorHandlerService.authErrorHandler(e.code);
    }
    return userCredential;
  }

  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await EasyLoading.dismiss();
      log(e.toString());
      errorHandlerService.authErrorHandler(e.code);
    }
    return userCredential;
  }
}
