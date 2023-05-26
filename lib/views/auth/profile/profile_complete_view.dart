import 'package:digital_order_system/products/components/radio/custom_radio_text.dart';
import 'package:digital_order_system/products/enums/alert_enum.dart';
import 'package:digital_order_system/products/view_models/image_view_model.dart';
import 'package:digital_order_system/products/view_models/register_view_model.dart';
import 'package:flutter/services.dart';

import '../../../_export_ui.dart';
import '../../../products/components/text_field/profile_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../products/components/button/custom_button.dart';

class ProfileCompleteView extends StatelessWidget with BaseSingleton {
  final userPv = Provider.of<UserSelectionViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  final registerViewModel = Provider.of<RegisterViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );

  ProfileCompleteView({super.key});

  Future complateProfile(BuildContext context) async {
    await registerViewModel.profileComplate();
  }

  Future showInfoAlert(BuildContext context, String subtitle) async {
    await uiUtils.showAlertDialog(
      context: context,
      alertEnum: AlertEnum.INFO,
      contentTitle: "UYARI",
      contentSubtitle: subtitle,
      buttonLabel: "KAPAT",
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
        child: Consumer<UserSelectionViewModel>(
          builder: (context, pv, _) {
            return ListView(
              padding: context.padding10x,
              children: [
                nameField(context),
                context.emptySizedHeightBox2x,
                userPv.isCustomer
                    ? Column(
                        children: [
                          lastNameTextField(context),
                          context.emptySizedHeightBox2x,
                          dateOfBirthTextField(context),
                          context.emptySizedHeightBox2x,
                        ],
                      )
                    : Column(
                        children: [
                          openingTime(context),
                          context.emptySizedHeightBox2x,
                          closingTime(context),
                          context.emptySizedHeightBox2x,
                        ],
                      ),
                phoneTextFiled(context),
                pv.isCustomer
                    ? Column(
                        children: [
                          context.emptySizedHeightBox2x,
                          Consumer<RegisterViewModel>(
                            builder: (context, pv, _) {
                              return Row(
                                children: [
                                  maleRadio(pv),
                                  context.emptySizedWidthBox4x,
                                  femaleRadio(pv),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Container(),
                context.emptySizedHeightBox4x,
                complateButton(context)
              ],
            );
          },
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
          Consumer<ImageViewModel>(
            builder: (context, pv, _) {
              return SizedBox(
                width: context.maxFinite,
                height: context.val5x * 6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    selectImage(pv, context),
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

  GestureDetector selectImage(ImageViewModel pv, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (userPv.isCustomer) {
          await showInfoAlert(
            context,
            "Yapay zeka destekli yemek önerme sistemimizden yararlanabilmeniz için kişisel resminizi koymanız gerekmektedir.",
          );
        }
        await pv.selectImage;
      },
      child: Container(
        decoration: imageDecoration(context, pv),
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
    );
  }

  BoxDecoration imageDecoration(BuildContext context, ImageViewModel pv) {
    return BoxDecoration(
      color: colors.notYoCheese,
      borderRadius: context.borderRadius6x,
      image: pv.selectedImage != null
          ? DecorationImage(
              image: FileImage(pv.selectedImage!),
              fit: BoxFit.cover,
            )
          : null,
    );
  }

  Positioned deleteImageBtn(BuildContext context, ImageViewModel pv) {
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

  ProfileTextField nameField(BuildContext context) {
    return ProfileTextField(
      labelText: userPv.isCustomer
          ? AppLocalizations.of(context)!.firstNameLabelText
          : "Restaurant Adı",
      hintText: userPv.isCustomer
          ? AppLocalizations.of(context)!.firstNameHintText
          : "Lütfen Restaurant Adı Girin",
      textInputAction: TextInputAction.next,
      controller: registerViewModel.nameController,
    );
  }

  ProfileTextField lastNameTextField(BuildContext context) {
    return ProfileTextField(
      labelText: AppLocalizations.of(context)!.lastNameLabelText,
      hintText: AppLocalizations.of(context)!.lastNameHintText,
      textInputAction: TextInputAction.next,
      controller: registerViewModel.surnameController,
    );
  }

  ProfileTextField dateOfBirthTextField(BuildContext context) {
    return ProfileTextField(
      controller: registerViewModel.dateController,
      labelText: AppLocalizations.of(context)!.dateOfBirthLabelText,
      hintText: AppLocalizations.of(context)!.dateOfBirthHintText,
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () => showInfoAlert(
          context,
          "Yemek öneri sisteminden faydalanmak için doğum tarihini girmeniz önemle rica olunur.",
        ),
        icon: const Icon(Icons.info),
      ),
      onTap: () {
        registerViewModel.getDateTimePicker(
          context: context,
          controller: registerViewModel.dateController,
        );
      },
    );
  }

  ProfileTextField openingTime(BuildContext context) {
    return ProfileTextField(
      controller: registerViewModel.openingTimeController,
      labelText: "Açılış Saati",
      hintText: "Açılış Saati Seçiniz",
      readOnly: true,
      onTap: () {
        registerViewModel.getTimePicker(
          context: context,
          controller: registerViewModel.openingTimeController,
        );
      },
    );
  }

  ProfileTextField closingTime(BuildContext context) {
    return ProfileTextField(
      controller: registerViewModel.closingTimeController,
      labelText: "Kapanış Saati",
      hintText: "Kapanış Saati Seçiniz",
      readOnly: true,
      onTap: () {
        registerViewModel.getTimePicker(
          context: context,
          controller: registerViewModel.closingTimeController,
        );
      },
    );
  }

  ProfileTextField phoneTextFiled(BuildContext context) {
    return ProfileTextField(
      labelText: "Telefon Numarası",
      hintText: "5XXX XXX XXX",
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      controller: registerViewModel.phoneController,
      inputFormatters: [
        FilteringTextInputFormatter(RegExp("[0-9]*"), allow: true),
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  CustomRadioText<dynamic> maleRadio(RegisterViewModel pv) {
    return CustomRadioText(
      value: pv.male,
      groupValue: pv.gender,
      onChanged: pv.selectGender,
      text: "Erkek",
    );
  }

  CustomRadioText<dynamic> femaleRadio(RegisterViewModel pv) {
    return CustomRadioText(
      value: pv.female,
      groupValue: pv.gender,
      onChanged: pv.selectGender,
      text: "Bayan",
    );
  }

  CustomButton complateButton(BuildContext context) {
    return CustomButton(
      context: context,
      buttonType: CustomButtonEnum.large,
      label: AppLocalizations.of(context)!.complateBtn,
      onTap: () => complateProfile(context),
    );
  }
}
