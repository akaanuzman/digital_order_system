import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isObscureText = true;
  bool isRememberMe = false;

  void get openOrCloseObscureText {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  void get onChangedRememberMe {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }
}