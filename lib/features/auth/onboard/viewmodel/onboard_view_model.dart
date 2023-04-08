// import '_export_onboard_view_model.dart';

import 'package:digital_order_system/features/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class OnboardViewModel extends ChangeNotifier {
  int pageIndex = 0;
  bool isOld = false;
  final PageController pageController = PageController(initialPage: 0);
  final box = GetStorage();


  void setPageIndex(int val) {
    pageIndex = val;
    notifyListeners();
  }

  void finishOnboard(BuildContext context) {
    isOld = true;
    box.write("openOnboard", isOld);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const RegisterView()),
      (route) => false,
    );
  }

  get nextPage {
    if (pageIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      finishOnboard;
    }
  }
}
