// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/models/service/customer_model.dart';
import 'package:digital_order_system/products/models/service/restaurant_model.dart';
import 'package:digital_order_system/products/utility/service/firestore_service.dart';
import 'package:digital_order_system/products/utility/service/locale_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../views/auth/profile/profile_complete_view.dart';
import '../utility/service/auth_service.dart';

class RegisterViewModel extends ChangeNotifier with BaseSingleton {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FireStoreService fireStoreService = FireStoreService();
  BuildContext context = NavigationService.navigatorKey.currentContext!;

  bool isObscureText = true;

  void get openOrCloseObscureText {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  bool get validateUser {
    if (mailController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "E-posta bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (passwordController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Şifre bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (passwordController.text.length < 6) {
      uiUtils.showSnackbar(
        context: context,
        text: "Şifreniz 6 karakterden büyük olmalıdır",
        isFail: true,
      );
      return false;
    }
    // if (nameController.text.isEmpty) {
    //   uiUtils.showSnackbar(
    //     context: context,
    //     text: "İsim bilgisi boş geçilemez",
    //     isFail: true,
    //   );
    //   return false;
    // }
    // if (surnameController.text.isEmpty) {
    //   uiUtils.showSnackbar(
    //     context: context,
    //     text: "Soyisim bilgisi boş geçilemez",
    //     isFail: true,
    //   );
    //   return false;
    // }
    // if (dateController.text.isEmpty) {
    //   uiUtils.showSnackbar(
    //     context: context,
    //     text: "Doğum tarihi bilgisi boş geçilemez",
    //     isFail: true,
    //   );
    //   return false;
    // }
    // if (phoneController.text.isEmpty) {
    //   uiUtils.showSnackbar(
    //     context: context,
    //     text: "Telefon numarası bilgisi boş geçilemez",
    //     isFail: true,
    //   );
    //   return false;
    // }
    return true;
  }

  Future signUp(bool isCustomer) async {
    if (!validateUser) {
      return;
    }
    await _signUp(isCustomer);
  }

  Future _signUp(bool isCustomer) async {
    await EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    UserCredential? userCredential;
    userCredential = await AuthService().signUpWithEmail(
      mailController.text,
      passwordController.text,
    );
    if (userCredential != null) {
      String userId = userCredential.user!.uid;
      if (isCustomer) {
        CustomerModel customer = CustomerModel();
        customer.createdDate = Timestamp.fromDate(DateTime.now());
        customer.mail = mailController.text;
        customer.isActive = true;
        Map<String, dynamic> customerJson = customer.toJson();
        await fireStoreService.signUp(
          userModel: customerJson,
          uid: userId,
          isCustomer: isCustomer,
        );
        customerJson['createdDate'] =
            customer.createdDate!.toDate().microsecondsSinceEpoch;
        LocaleServices().saveAccount(customerJson);
      } else {
        RestaurantModel restaurant = RestaurantModel();
        restaurant.createdDate = Timestamp.fromDate(DateTime.now());
        restaurant.companyMail = mailController.text;
        restaurant.isActive = true;
        Map<String, dynamic> restaurantJson = restaurant.toJson();
        await fireStoreService.signUp(
          userModel: restaurantJson,
          uid: userId,
          isCustomer: isCustomer,
        );
        restaurantJson['createdDate'] =
            restaurant.createdDate!.toDate().microsecondsSinceEpoch;
        LocaleServices().saveAccount(restaurantJson);
      }
      await EasyLoading.dismiss();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileCompleteView(),
        ),
        (route) => false,
      );
    }
  }
}
