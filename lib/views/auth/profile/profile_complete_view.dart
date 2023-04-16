import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/text_field/profile_text_field.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/views/common/navbar/navbar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../products/components/button/custom_button.dart';

class ProfileCompleteView extends StatelessWidget with BaseSingleton {
  final bool isUser;
  const ProfileCompleteView({
    super.key,
    required this.isUser,
  });

  void goToNavbarView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavbarView(isUser: isUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.val15x * 3),
        child: FadeInDown(
          child: AppBar(
            backgroundColor: colors.redSavinaPepper,
            iconTheme: const IconThemeData(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                  context.val24x * 2,
                  context.val24x,
                ),
              ),
            ),
            title: appBarTitle(context),
            bottom: appBarImage(context),
          ),
        ),
      ),
      body: FadeInUp(
        child: ListView(
          padding: context.padding10x,
          children: [
            userNameTextField(context),
            context.emptySizedHeightBox2x,
            firstNameTextField(context),
            context.emptySizedHeightBox2x,
            lastNameTextField(context),
            context.emptySizedHeightBox2x,
            dateOfBirthTextField(context),
            context.emptySizedHeightBox4x,
            complateButton(context)
          ],
        ),
      ),
    );
  }

  Text appBarTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.createProfileAppBarTitle,
      style: const TextStyle(
        color: Colors.white,
      ),
      maxLines: 2,
    );
  }

  PreferredSize appBarImage(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(context.val4x),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.notYoCheese,
              borderRadius: context.borderRadius7x,
            ),
            height: context.val5x * 4,
            width: context.val5x * 4,
            child: Icon(
              Icons.camera_alt_outlined,
              size: context.val10x,
              color: Colors.white,
            ),
          ),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  ProfileTextField userNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.usernameLabelText,
      hintText: AppLocalizations.of(context)!.usernameHintText,
      textInputAction: TextInputAction.next,
    );
  }

  ProfileTextField firstNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.firstNameLabelText,
      hintText: AppLocalizations.of(context)!.firstNameHintText,
      textInputAction: TextInputAction.next,
    );
  }

  ProfileTextField lastNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.lastNameLabelText,
      hintText: AppLocalizations.of(context)!.lastNameHintText,
      textInputAction: TextInputAction.next,
    );
  }

  ProfileTextField dateOfBirthTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.dateOfBirthLabelText,
      hintText: AppLocalizations.of(context)!.dateOfBirthHintText,
    );
  }

  CustomButton complateButton(BuildContext context) {
    return CustomButton(
      context: context,
      buttonType: CustomButtonEnum.large,
      label: AppLocalizations.of(context)!.complateBtn,
      onTap: () => goToNavbarView(context),
    );
  }
}
