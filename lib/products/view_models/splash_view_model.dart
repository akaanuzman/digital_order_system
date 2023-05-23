// ignore_for_file: use_build_context_synchronously

import 'package:digital_order_system/products/enums/alert_enum.dart';
import 'package:digital_order_system/products/enums/platform_enum.dart';
import 'package:digital_order_system/products/models/service/verison_model.dart';
import 'package:digital_order_system/products/utility/service/collections_service.dart';
import 'package:digital_order_system/products/utility/managers/version_manager.dart';
import 'package:digital_order_system/products/utility/service/locale_services.dart';
import 'package:digital_order_system/views/auth/profile/profile_complete_view.dart';
import 'package:digital_order_system/views/common/navbar/navbar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../_export_ui.dart';
import '../../views/auth/user_selection/user_selection_view.dart';
import '../../views/common/splash/splash_view.dart';
import '../../views/common/onboard/onboard_view.dart';

class SplashViewModel extends ChangeNotifier with BaseSingleton {
  final LocaleServices localeServices = LocaleServices();
  bool isRequiredForceUpdate = false;
  bool isLogin = false;
  bool isDontComplateProfile = true;

  Future<bool> get initPage async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    bool isRedirectHome = await localeServices.readOnboard();
    Map<String, dynamic>? user = await localeServices.readAccount();
    if (user != null) {
      isLogin = true;
      if (user['companyName'] != null || user['name'] != null) {
        isDontComplateProfile = false;
      } else {
        isDontComplateProfile = true;
      }
    }
    checkAppLicationVersion(packageInfo.version);
    return isRedirectHome;
  }

  void hasRequiredForceUpdate(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isRequiredForceUpdate) {
        uiUtils.showAlertDialog(
            context: context,
            alertEnum: AlertEnum.INFO,
            contentTitle: "Yeni güncelleme var!",
            contentSubtitle:
                "Lütfen hatasız bir hizmet almak için en güncel versiyonunu indir.",
            buttonLabel: "TAMAM",
            onTap: () => launchUrlString(PlatformEnum.getMarketUrl));
      }
    });
  }

  Widget screenSelectionByStorage(
      BuildContext context, AsyncSnapshot<bool> snapshot) {
    Widget splashBody = SplashView().body(context);

    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return splashBody;
      default:
        if (snapshot.hasData) {
          return Consumer<SplashViewModel>(
            builder: (context, pv, _) {
              hasRequiredForceUpdate(context);
              return !snapshot.data!
                  ? OnboardView()
                  : isLogin && isDontComplateProfile
                      ? ProfileCompleteView()
                      : isLogin && !isDontComplateProfile
                          ? NavbarView()
                          : const UserSelectionView();
            },
          );
        } else if (!snapshot.hasData) {
          return OnboardView();
        }
        return splashBody;
    }
  }

  Future<void> checkAppLicationVersion(String clientVersion) async {
    final dbValue = await getVersionNumberFromDb();

    if (dbValue == null || dbValue.isEmpty) {
      isRequiredForceUpdate = true;
      notifyListeners();
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(
      clientVersion: clientVersion,
      dbVersion: dbValue,
    );

    if (checkIsNeedForceUpdate.isNeedUpdate) {
      isRequiredForceUpdate = true;
      notifyListeners();
      return;
    }
  }

  // If user coming from browser, we don't need to check version control.
  Future<String?> getVersionNumberFromDb() async {
    if (kIsWeb) return null;

    final response = await CollectionsService.Version.reference
        .withConverter<VersionModel>(
          fromFirestore: (snapshot, options) =>
              VersionModel().fromFirebase(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();
    return response.data()?.versionNumber;
  }
}
