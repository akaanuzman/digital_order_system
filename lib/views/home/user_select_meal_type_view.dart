import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/constants/image_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserSelectMealTypeView extends StatelessWidget with BaseSingleton {
  const UserSelectMealTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: homePageAppBarTitle(context),
        actions: [
          homePageAppBarActions(context),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: context.val8x),
        itemCount: 4,
        separatorBuilder: (context, index) {
          return context.emptySizedHeightBox3x;
        },
        itemBuilder: (context, index) {
          return homePageStack(context, ImageConstants.mainDishes.toPng);
        },
      ),
    );
  }

  Widget homePageStack(BuildContext context, String imageLabel) {
    return Padding(
      padding: context.paddingHorizontal10x,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(imageLabel),
          Text(
            AppLocalizations.of(context)!
                .mainDishes, //parametre olarak nasıl verebilirim diye sor kaana.
            style: context.textTheme.headlineLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Text homePageAppBarTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.homeAppBarTitle,
    );
  }

  Row homePageAppBarActions(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_outlined,
          color: colors.textColor,
          size: context.val8x,
        ),
        context.emptySizedWidthBox3x,
        Icon(
          Icons.search,
          color: colors.textColor,
          size: context.val8x,
        ),
        context.emptySizedWidthBox3x,
      ],
    );
  }
}
