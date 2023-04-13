import '../../core/utils/navigator_service.dart';
import '../../views/common/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../views/common/onboard/onboard_view.dart';
import '../../views/auth/user_selection/user_selection_view.dart';

class SplashViewModel extends ChangeNotifier {
  final box = GetStorage();

  Future<bool> get initPage async {
    final result = await box.read("openOnboard");
    return result;
  }

  Widget screenSelectionByStorage(AsyncSnapshot<bool> snapshot) {
    Widget splashBody =
        SplashView().body(NavigationService.navigatorKey.currentContext!);
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return splashBody;
      default:
        if (snapshot.hasData) {
          return !snapshot.data! ? OnboardView() : const UserSelectionView();
        } else if (!snapshot.hasData) {
          return OnboardView();
        }
        return splashBody;
    }
  }
}
