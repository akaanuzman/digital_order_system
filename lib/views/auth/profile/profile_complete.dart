import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/text_field/profile_text_field.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../products/components/button/custom_button.dart';

class ProfileCompleteView extends StatelessWidget with BaseSingleton {
  const ProfileCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.val15x * 3.5),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(150, 100),
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.createProfileAppBarTitle,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(context.val4x),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colors.notYoCheese,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: context.val5x * 4,
                  width: context.val5x * 4,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: context.val10x,
                    color: Colors.white,
                  ),
                ),
                context.emptySizedHeightBox4x,
              ],
            ),
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

  CustomButton complateButton(BuildContext context) {
    return CustomButton(
      context: context,
      buttonType: CustomButtonEnum.large,
      label: AppLocalizations.of(context)!.complateBtn,
    );
  }

  ProfileTextField dateOfBirthTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.dateOfBirthLabelText,
      hintText: AppLocalizations.of(context)!.dateOfBirthHintText,
    );
  }

  ProfileTextField lastNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.lastNameLabelText,
      hintText: AppLocalizations.of(context)!.lastNameHintText,
    );
  }

  ProfileTextField firstNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.firstNameLabelText,
      hintText: AppLocalizations.of(context)!.firstNameHintText,
    );
  }

  ProfileTextField userNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.usernameLabelText,
      hintText: AppLocalizations.of(context)!.usernameHintText,
    );
  }
}
