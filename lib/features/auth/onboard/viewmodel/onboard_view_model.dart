// import '_export_onboard_view_model.dart';

import 'package:digital_order_system/core/helpers/storage.dart';
import 'package:digital_order_system/core/utils/navigation_service.dart';
import 'package:digital_order_system/features/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';

class OnboardViewModel extends ChangeNotifier {
  int pageIndex = 0;
  bool isOld = false;
  final PageController pageController = PageController(initialPage: 0);

  void setPageIndex(int val) {
    pageIndex = val;
    notifyListeners();
  }

  void get finishOnboard {
    isOld = true;
    if (isOld) {
      Storage().saveStorage(
        token: "isOpen",
        key: "openOnboard",
      );
    }
    Navigator.of(NavigationService.navigatorKey.currentContext!).pushAndRemoveUntil(
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
