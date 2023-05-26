// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/enums/gender_enum.dart';
import 'package:digital_order_system/products/models/service/customer_model.dart';
import 'package:digital_order_system/products/models/service/restaurant_model.dart';
import 'package:digital_order_system/products/utility/service/firestore_service.dart';
import 'package:digital_order_system/products/utility/service/locale_services.dart';
import 'package:digital_order_system/products/view_models/image_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../views/auth/profile/profile_complete_view.dart';
import '../../views/common/navbar/navbar_view.dart';
import '../utility/service/auth_service.dart';
import '../utility/service/storage_service.dart';

class RegisterViewModel extends ChangeNotifier with BaseSingleton {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController openingTimeController = TextEditingController();
  final TextEditingController closingTimeController = TextEditingController();

  DateTime? selectedBirthdate;

  final FireStoreService fireStoreService = FireStoreService();
  final LocaleServices localeServices = LocaleServices();
  BuildContext context = NavigationService.navigatorKey.currentContext!;

  bool isObscureText = true;
  GenderEnum gender = GenderEnum.unselected;
  GenderEnum male = GenderEnum.male;
  GenderEnum female = GenderEnum.female;

  void selectGender(val) {
    gender = val;
    notifyListeners();
  }

  void get openOrCloseObscureText {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  Future getDateTimePicker({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value != null) {
          DateFormat dateFormat = DateFormat.yMd('tr');
          controller.text = dateFormat.format(value);
          selectedBirthdate = value;
        } else {
          controller.text = "";
          selectedBirthdate = value;
        }
      },
    );
  }

  Future getTimePicker({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) {
        if (value != null) {
          controller.text = value.format(context);
        } else {
          controller.text = "";
        }
      },
    );
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
    return true;
  }

  Future signUp() async {
    final pv = Provider.of<UserSelectionViewModel>(context, listen: false);
    if (!validateUser) {
      return;
    }
    await _signUp(pv.isCustomer);
  }

  Future _signUp(bool isCustomer) async {
    UserCredential? userCredential;
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    // Save firebase auth table.
    userCredential = await AuthService().signUpWithEmail(
      mailController.text,
      passwordController.text,
    );
    if (userCredential != null) {
      String userId = userCredential.user!.uid;
      if (isCustomer) {
        customerRegister(userId, isCustomer);
      } else {
        restaurantRegister(userId, isCustomer);
      }
      await EasyLoading.dismiss();
      uiUtils.showSnackbar(
        context: context,
        text: "Kayıt işlemi başarılı!",
      );
      localeServices.saveAccount(userId);
      localeServices.saveIsCustomer(isCustomer);
      localeServices.saveProfileComplate(false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileCompleteView(),
        ),
        (route) => false,
      );
    }
  }

  // Write firestore db for customer register information
  Future customerRegister(String userId, bool isCustomer) async {
    CustomerModel customer = CustomerModel();
    customer.createdDate = Timestamp.fromDate(DateTime.now());
    customer.mail = mailController.text;
    customer.isActive = true;
    customer.customerId = userId;
    Map<String, dynamic> customerJson = customer.toJson();
    await fireStoreService.signUp(
      userModel: customerJson,
      uid: userId,
      isCustomer: isCustomer,
    );
  }

  // Write firestore db for restaurant register information
  Future restaurantRegister(String userId, bool isCustomer) async {
    RestaurantModel restaurant = RestaurantModel();
    restaurant.createdDate = Timestamp.fromDate(DateTime.now());
    restaurant.companyMail = mailController.text;
    restaurant.isActive = true;
    restaurant.restaurantId = userId;
    Map<String, dynamic> restaurantJson = restaurant.toJson();
    await fireStoreService.signUp(
      userModel: restaurantJson,
      uid: userId,
      isCustomer: isCustomer,
    );
  }

  bool get validateCustomerProfileComplate {
    if (nameController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "İsim bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (surnameController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Soyisim bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (dateController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Doğum tarihi bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (phoneController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Telefon numarası bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (gender == GenderEnum.unselected) {
      uiUtils.showSnackbar(
        context: context,
        text: "Cinsiyet bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    return true;
  }

  bool get validateRestaurantProfileComplate {
    if (nameController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "İsim bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (openingTimeController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Açlış saati bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (closingTimeController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Kapanış saati bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    if (phoneController.text.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Telefon numarası bilgisi boş geçilemez",
        isFail: true,
      );
      return false;
    }
    return true;
  }

  Future profileComplate() async {
    final pv = Provider.of<UserSelectionViewModel>(context, listen: false);
    if (pv.isCustomer && !validateCustomerProfileComplate) {
      await EasyLoading.dismiss();
      return;
    } else if (!pv.isCustomer && !validateRestaurantProfileComplate) {
      await EasyLoading.dismiss();
    } else {
      await _profileComplate(pv.isCustomer);
    }
  }

  Future _profileComplate(bool isCustomer) async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    if (isCustomer) {
      customerProfileComplate(isCustomer);
    } else {
      restaurantProfileComplate(isCustomer);
    }
  }

  // writes the customer's profile completion form to the database
  void customerProfileComplate(bool isCustomer) {
    CustomerModel customer = CustomerModel();
    customer.name = nameController.text;
    customer.surname = surnameController.text;
    customer.fullName = "${nameController.text} ${surnameController.text}";
    customer.phone = phoneController.text;
    customer.birthDate = Timestamp.fromDate(selectedBirthdate!);
    customer.age = DateTime.now().year - selectedBirthdate!.year;
    gender == GenderEnum.male
        ? customer.gender = true
        : customer.gender = false;
    genericProfileComplate(
      model: customer,
      isCustomer: isCustomer,
    );
  }

  // writes the restaurant's profile completion form to the database
  void restaurantProfileComplate(bool isCustomer) {
    RestaurantModel restaurant = RestaurantModel();
    restaurant.companyName = nameController.text;
    restaurant.openingTime = openingTimeController.text;
    restaurant.closingTime = closingTimeController.text;
    restaurant.companyNumber = phoneController.text;
    genericProfileComplate(
      model: restaurant,
      isCustomer: isCustomer,
    );
  }

  // Writing data as generic to database
  /// [dynamic model] : can only be customer model and restaurant model
  Future genericProfileComplate({
    dynamic model,
    required bool isCustomer,
  }) async {
    final pv = Provider.of<ImageViewModel>(context, listen: false);
    if (model is CustomerModel || model is RestaurantModel) {
      if (pv.selectedImage != null) {
        var imagePath = isCustomer ? "Customers/" : "Restaurants/";
        List<String> response = await StorageService()
            .uploadImage(pv.selectedImage!.path, imagePath);
        model.imageUrl = response[0];
        model.imageStoragePath = response[1];
      }
      Map<String, dynamic> json = model.toJson();
      await fireStoreService.updateUser(
        userModel: json,
        isCustomer: isCustomer,
      );
      await EasyLoading.dismiss();
      uiUtils.showSnackbar(
        context: context,
        text: "Değişiklikler başarıyla kaydedildi!",
      );
      localeServices.saveProfileComplate(true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavbarView(),
        ),
      );
    }
  }
}
