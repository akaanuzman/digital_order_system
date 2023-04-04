// import '_export_onboard_view_model.dart';

// class OnboardViewModel extends GetxController {
//   final box = GetStorage();
//   RxInt pageIndex = 0.obs;
//   RxBool isOld = false.obs;
//   final PageController pageController = PageController(initialPage: 0);

//   List<OnboardModel> get pages => [
//         OnboardModel(
//           imageUrl: "onboarding0".toPng,
//           title: "onboardTitle1".tr,
//           subtitle: "onboardSubtitle1".tr,
//         ),
//         OnboardModel(
//           imageUrl: "onboarding1".toPng,
//           title: "onboardTitle2".tr,
//           subtitle: "onboardSubtitle2".tr,
//         ),
//         OnboardModel(
//           imageUrl: "onboarding2".toPng,
//           title: "onboardTitle3".tr,
//           subtitle: "onboardSubtitle3".tr,
//         ),
//       ];

//   void setPageIndex(int val) {
//     pageIndex.value = val;
//   }

//   void get finishOnboard {
//     isOld.value = true;
//     box.write("isOld", isOld.value);
//     Get.offNamedUntil("/login", (route) => false);
//   }
// }
