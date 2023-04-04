// import 'package:digital_order_system/core/base/base_singleton.dart';

// import '_export_onboard_view.dart';

// class OnboardView extends StatelessWidget with BaseSingleton {
//   final viewModel = Get.put(OnboardViewModel());
//   OnboardView({super.key});

//   get nextPage {
//     if (viewModel.pageIndex.value < 2) {
//       viewModel.pageController.nextPage(
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.ease,
//       );
//     } else {
//       viewModel.finishOnboard;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages,
//     );
//   }

//   PageView get pages {
//     return PageView.builder(
//       controller: viewModel.pageController,
//       itemCount: viewModel.pages.length,
//       onPageChanged: (val) => viewModel.setPageIndex(val),
//       itemBuilder: (_, index) {
//         OnboardModel page = viewModel.pages[index];
//         return pageItem(page);
//       },
//     );
//   }

//   FadeInUp pageItem(OnboardModel page) {
//     return FadeInUp(
//       child: Padding(
//         padding: padding.p2x,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Spacer(),
//             image(page),
//             sizedBox.hBox2x,
//             titleAndSubtitleSection(page),
//             indicators,
//             Expanded(child: buttons)
//           ],
//         ),
//       ),
//     );
//   }

//   AspectRatio image(OnboardModel page) {
//     return AspectRatio(
//       aspectRatio: 1.25,
//       child: Image.asset(
//         page.imageUrl,
//       ),
//     );
//   }

//   Padding titleAndSubtitleSection(OnboardModel page) {
//     return Padding(
//       padding: padding.p2x,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           title(page),
//           sizedBox.hBox1x,
//           subtitle(page),
//         ],
//       ),
//     );
//   }

//   Text title(OnboardModel page) {
//     return Text(
//       page.title,
//       style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),
//       textAlign: TextAlign.start,
//     );
//   }

//   Text subtitle(OnboardModel page) =>
//       Text(page.subtitle, style: Get.textTheme.subtitle1);

//   Row get indicators {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         viewModel.pages.length,
//         (index) {
//           return indicatorItem(index);
//         },
//       ),
//     );
//   }

//   Obx indicatorItem(int index) {
//     return Obx(
//       () {
//         int pageIndex = viewModel.pageIndex.value;
//         Color containerColor =
//             pageIndex == index ? colors.royalBlue : colors.gray;
//         double height = 8.0;
//         double width = pageIndex == index ? 32.0 : 16.0;
//         return AnimatedContainer(
//           duration: duration.dLow2x,
//           margin: padding.p1x,
//           decoration: BoxDecoration(
//             color: containerColor,
//             borderRadius: borderRadius.br1x,
//           ),
//           height: height,
//           width: width,
//         );
//       },
//     );
//   }

//   Obx get buttons {
//     return Obx(
//       () {
//         int pageIndex = viewModel.pageIndex.value;
//         Widget isVisibleSkipBtn = pageIndex < 2 ? skipBtn : const SizedBox();
//         return Padding(
//           padding: padding.p2x,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               isVisibleSkipBtn,
//               nextOrLetsStartBtn(pageIndex),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   TextButton get skipBtn {
//     return TextButton(
//       onPressed: () => viewModel.finishOnboard,
//       child: Text(
//         "skipBtn".tr,
//         style: Get.textTheme.headline6!.copyWith(
//           fontWeight: FontWeight.w700,
//           color: colors.royalBlue,
//         ),
//       ),
//     );
//   }

//   InkWell nextOrLetsStartBtn(int pageIndex) {
//     return InkWell(
//       onTap: () => nextPage,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             pageIndex < 2 ? "nextBtn".tr : "letsStartBtn".tr,
//             style:
//                 Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),
//           ),
//           sizedBox.wBox1x,
//           const Icon(Icons.arrow_forward_outlined),
//         ],
//       ),
//     );
//   }
// }
