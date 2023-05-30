// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:digital_order_system/products/utility/service/firestore_service.dart';
import 'package:digital_order_system/products/utility/service/locale_services.dart';
import 'package:digital_order_system/products/view_models/customer_view_model.dart';
import 'package:digital_order_system/products/view_models/restaurant_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../_export_ui.dart';
import '../../views/common/navbar/navbar_view.dart';
import '../utility/service/auth_service.dart';

class LoginViewModel extends ChangeNotifier with BaseSingleton {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  bool isRememberMe = false;
  final FireStoreService fireStoreService = FireStoreService();
  final LocaleServices localeServices = LocaleServices();

  void get openOrCloseObscureText {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  void get onChangedRememberMe {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }

  Future signIn() async {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    if (validator) {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
      UserCredential? userCredential = await AuthService()
          .signInWithEmail(emailController.text, passwordController.text);
      if (userCredential != null) {
        String uid = userCredential.user!.uid;
        final pv = Provider.of<UserSelectionViewModel>(context, listen: false);
        if (pv.isCustomer) {
          final customerVM =
              Provider.of<CustomerViewModel>(context, listen: false);
          await customerVM.getCustomerInformation(uid);
          if (customerVM.currentCustomer.customerId == null) {
            uiUtils.showSnackbar(
              context: context,
              text: "Hesap bulunamadı",
              isFail: true,
            );
            await EasyLoading.dismiss();
            return;
          }
        } else {
          log("object");
          final restaurantVM =
              Provider.of<RestaurantViewModel>(context, listen: false);
          await restaurantVM.getRestaurantInformation(uid);
          if (restaurantVM.currentRestaurant.restaurantId == null) {
            uiUtils.showSnackbar(
              context: context,
              text: "Hesap bulunamadı",
              isFail: true,
            );
            await EasyLoading.dismiss();
            return;
          }
        }
        if (isRememberMe) {
          localeServices.saveAccount(uid);
          localeServices.saveIsCustomer(pv.isCustomer);
          localeServices.saveProfileComplate(true);
        }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => NavbarView(),
          ),
          (route) => false,
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

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }
}
