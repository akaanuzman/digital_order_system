import 'dart:developer';

import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/products/utility/base/base_singleton.dart';

class ErrorHandlerService extends BaseSingleton {
  Future<String> authErrorHandler(String errorCode) async {
    log(errorCode);
    String errorMessage;
    switch (errorCode) {
      case "email-already-in-use":
        errorMessage = "Kullanıcı mevcut. Lütfen giriş yapın";
        break;
      case "wrong-password":
        errorMessage = "Şifre yanlış.";
        break;
      case "user-not-found":
        errorMessage = "Kullanıcı bulunamadı.";
        break;
      case "operation-not-allowed":
        errorMessage =
            "Oturum açma limiti aşıldı. Lütfen daha sonra tekrar deneyin.";
        break;
      case "invalid-email":
        errorMessage = "E-posta adresi yanlış.";
        break;
      default:
        errorMessage = "İnternet bağlantınızı kontrol edin.";
        break;
    }

    uiUtils.showSnackbar(
      context: NavigationService.navigatorKey.currentContext!,
      text: errorMessage,
      isFail: true,
    );

    return errorMessage;
  }
}
