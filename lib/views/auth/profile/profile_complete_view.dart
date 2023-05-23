import 'package:digital_order_system/products/enums/alert_enum.dart';
import 'package:digital_order_system/products/view_models/register_view_model.dart';
import 'package:intl/intl.dart';

import '../../../_export_ui.dart';
import '../../../products/components/text_field/profile_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';
import '../../common/navbar/navbar_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../products/components/button/custom_button.dart';

class ProfileCompleteView extends StatelessWidget with BaseSingleton {
  final pv = Provider.of<UserSelectionViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  final registerViewModel = Provider.of<RegisterViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  final TextEditingController dateController = TextEditingController();

  ProfileCompleteView({
    super.key,
  });

  void goToNavbarView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavbarView(),
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
          Consumer<RegisterViewModel>(
            builder: (context, pv, _) {
              return SizedBox(
                width: context.maxFinite,
                height: context.val5x * 6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => pv.selectImage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.notYoCheese,
                          borderRadius: context.borderRadius6x,
                          image: pv.selectedImage != null
                              ? DecorationImage(
                                  image: FileImage(pv.selectedImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        height: context.val5x * 4,
                        width: context.val5x * 4,
                        child: pv.selectedImage != null
                            ? const SizedBox()
                            : Icon(
                                Icons.camera_alt_outlined,
                                size: context.val10x,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    deleteImageBtn(context, pv),
                  ],
                ),
              );
            },
          ),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Positioned deleteImageBtn(BuildContext context, RegisterViewModel pv) {
    return Positioned(
      right: 0,
      left: context.val17x,
      bottom: 10,
      child: GestureDetector(
        onTap: () => pv.deleteImage,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.delete,
            color: colors.redSavinaPepper,
          ),
        ),
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
      controller: dateController,
      labelText: AppLocalizations.of(context)!.dateOfBirthLabelText,
      hintText: AppLocalizations.of(context)!.dateOfBirthHintText,
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () {
          uiUtils.showAlertDialog(
            context: context,
            alertEnum: AlertEnum.INFO,
            contentTitle: "UYARI",
            contentSubtitle:
                "Yemek öneri sisteminden faydalanmak için doğum tarihini girmeniz önemle rica olunur.",
            buttonLabel: "KAPAT",
          );
        },
        icon: const Icon(Icons.info),
      ),
      onTap: () {
        uiUtils.getDateTimePicker(
          context: context,
          controller: dateController,
        );
      },
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
