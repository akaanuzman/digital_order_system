import '../../../products/models/local/onboard_model.dart';
import '../../../_export_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../products/view_models/onboard_view_model.dart';

class OnboardView extends StatelessWidget with BaseSingleton {
  final BuildContext context = NavigationService.navigatorKey.currentContext!;
  OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final pv = Provider.of<OnboardViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      body: Stack(
        children: [
          background,
          pages(pv),
        ],
      ),
    );
  }

  Positioned get background {
    return Positioned(
      bottom: -70,
      child: Image.asset(imageConstants.background),
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
          mainAxisAlignment: context.mainAxisACenter,
          children: [
            context.emptySizedHeightBox5x,
            Image.asset(imageConstants.logo),
            context.emptySizedHeightBox2x,
            const Spacer(),
            image(page),
            context.emptySizedHeightBox2x,
            titleAndSubtitleSection(page),
            indicators,
            Expanded(
              flex: 2,
              child: buttons,
            )
          ],
        ),
      ),
    );
  }

  Widget image(OnboardModel page) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.asset(
        page.imageUrl,
      ),
    );
  }

  Padding titleAndSubtitleSection(OnboardModel page) {
    return Padding(
      padding: context.padding4x,
      child: Column(
        crossAxisAlignment: context.crossAxisACenter,
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
      style: context.textTheme.displaySmall!.copyWith(
        color: colors.redSavinaPepper,
      ),
      textAlign: context.taCenter,
    );
  }

  Text subtitle(OnboardModel page) => Text(
        page.subtitle,
        style: context.textTheme.headlineMedium!
            .copyWith(fontWeight: context.fw400),
        textAlign: context.taCenter,
      );

  Row get indicators {
    return Row(
      mainAxisAlignment: context.mainAxisACenter,
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
        Color containerColor =
            pv.pageIndex == index ? colors.orangeade : colors.mandarinJelly;
        double height = 8.0;
        double width = pv.pageIndex == index ? 32.0 : 8.0;
        return AnimatedContainer(
          duration: context.durationLow2x,
          margin: context.padding1x / 2,
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isVisibleSkipBtn,
            nextOrLetsStartBtn(pv.pageIndex, pv),
          ],
        );
      },
    );
  }

  TextButton skipBtn(OnboardViewModel pv) {
    return TextButton(
      onPressed: () => pv.finishOnboard,
      child: Text(
        AppLocalizations.of(context)!.skipBtn,
        style: context.textTheme.headlineSmall!.copyWith(
          color: colors.gray,
        ),
      ),
    );
  }

  Widget nextOrLetsStartBtn(int pageIndex, OnboardViewModel pv) {
    return Container(
      margin: context.paddingHorizontal4x,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () => pv.nextPage,
        label: Text(
          pageIndex < 2
              ? AppLocalizations.of(context)!.nextBtn
              : AppLocalizations.of(context)!.letsStartBtn,
        ),
        icon: const Icon(Icons.arrow_forward_outlined),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: context.borderRadius4x,
          ),
        ),
      ),
    );
  }
}
