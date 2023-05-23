// import '_export_onboard_view_model.dart';

import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:flutter/material.dart';

import '../../views/auth/user_selection/user_selection_view.dart';
import '../utility/service/locale_services.dart';

class OnboardViewModel extends ChangeNotifier {
  int pageIndex = 0;
  bool isOld = false;
  final PageController pageController = PageController(initialPage: 0);
  final BuildContext context = NavigationService.navigatorKey.currentContext!;

  void setPageIndex(int val) {
    pageIndex = val;
    notifyListeners();
  }

  void get finishOnboard {
    isOld = true;
    LocaleServices().saveOnboard(isOld);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const UserSelectionView(),
      ),
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
