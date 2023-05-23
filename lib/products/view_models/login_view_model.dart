// ignore_for_file: use_build_context_synchronously

import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/products/utility/base/base_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../views/common/navbar/navbar_view.dart';
import '../utility/service/auth_service.dart';

class LoginViewModel extends ChangeNotifier with BaseSingleton {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  Future get signIn async {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    if (validator) {
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      UserCredential? userCredential = await AuthService()
          .signInWithEmail(emailController.text, passwordController.text);
      if (userCredential != null) {
        if (isRememberMe) {
          //TODO: ADD TO LOCAL STORAGE SERVİCE
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavbarView(),
          ),
        );
      }
      await EasyLoading.dismiss();
    }
  }

  bool get validator {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    if (emailController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: 'E-posta boş geçilemez',
        isFail: true,
      );
      return false;
    }
    if (passwordController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: 'Şifre alanı boş geçilemez',
        isFail: true,
      );
      return false;
    }
    return true;
  }
}
