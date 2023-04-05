import 'package:digital_order_system/features/auth/onboard/viewmodel/onboard_view_model.dart';
import '../model/onboard_model.dart';
import 'package:digital_order_system/_export_ui.dart';

class OnboardView extends StatelessWidget with BaseSingleton {
  final pv = Provider.of<OnboardViewModel>(
      NavigationService.navigatorKey.currentContext!,
      listen: false);
  final BuildContext context = NavigationService.navigatorKey.currentContext!;
  OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages(pv),
    );
  }

  PageView pages(OnboardViewModel pv) {
    return PageView.builder(
      controller: pv.pageController,
      itemCount: OnboardModelExtension.pages.length,
      onPageChanged: (val) => pv.setPageIndex(val),
      itemBuilder: (_, index) {
        OnboardModel page = OnboardModelExtension.pages[index];
        return pageItem(page);
      },
    );
  }

  FadeInUp pageItem(OnboardModel page) {
    return FadeInUp(
      child: Padding(
        padding: context.padding2x,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            image(page),
            context.emptySizedHeightBox2x,
            titleAndSubtitleSection(page),
            indicators,
            Expanded(child: buttons)
          ],
        ),
      ),
    );
  }

  AspectRatio image(OnboardModel page) {
    return AspectRatio(
      aspectRatio: 1.25,
      child: Image.asset(
        page.imageUrl,
      ),
    );
  }

  Padding titleAndSubtitleSection(OnboardModel page) {
    return Padding(
      padding: context.padding4x,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(page),
          context.emptySizedHeightBox1x,
          subtitle(page),
        ],
      ),
    );
  }

  Text title(OnboardModel page) {
    return Text(
      page.title,
      style:
          context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
      textAlign: TextAlign.start,
    );
  }

  Text subtitle(OnboardModel page) =>
      Text(page.subtitle, style: context.textTheme.bodySmall);

  Row get indicators {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnboardModelExtension.pages.length,
        (index) {
          return indicatorItem(index);
        },
      ),
    );
  }

  Widget indicatorItem(int index) {
    return Consumer<OnboardViewModel>(
      builder: (context, pv, _) {
        Color containerColor = pv.pageIndex == index ? colors.royalBlue : colors.grey;
        double height = 8.0;
        double width = pv.pageIndex == index ? 32.0 : 16.0;
        return AnimatedContainer(
          duration: context.durationLow2x,
          margin: context.padding1x,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: context.borderRadius1x,
          ),
          height: height,
          width: width,
        );
      },
    );
  }

  Widget get buttons {
    return Consumer<OnboardViewModel>(
      builder: (context, pv, _) {
        Widget isVisibleSkipBtn =
            pv.pageIndex < 2 ? skipBtn(pv) : const SizedBox();
        return Padding(
          padding: context.padding2x,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isVisibleSkipBtn,
              nextOrLetsStartBtn(pv.pageIndex, pv),
            ],
          ),
        );
      },
    );
  }

  TextButton skipBtn(OnboardViewModel pv) {
    return TextButton(
      onPressed: () => pv.finishOnboard,
      child: Text(
        "Geç",
        style: context.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w700,
          color: colors.royalBlue,
        ),
      ),
    );
  }

  InkWell nextOrLetsStartBtn(int pageIndex, OnboardViewModel pv) {
    return InkWell(
      onTap: () => pv.nextPage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            pageIndex < 2 ? "İlerle" : "Hadi Başla!",
            style: context.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          context.emptySizedWidthBox1x,
          const Icon(Icons.arrow_forward_outlined),
        ],
      ),
    );
  }
}
