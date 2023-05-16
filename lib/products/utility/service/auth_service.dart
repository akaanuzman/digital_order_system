import 'package:digital_order_system/products/utility/service/error_handler_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthService {
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
      ErrorHandlerService().authErrorHandler(e.code);
    }
    return userCredential;
  }
}
