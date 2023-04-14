import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isObscureText = true;

  void get openOrCloseObscureText {
    isObscureText = !isObscureText;
    notifyListeners();
  }
}
