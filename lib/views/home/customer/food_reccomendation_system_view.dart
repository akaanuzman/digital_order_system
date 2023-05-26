import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';
import 'package:digital_order_system/products/components/container/food_reccomendation_container.dart';
import 'package:digital_order_system/products/components/row/food_reccomendation_personel_info.dart';
import 'package:digital_order_system/products/constants/_export_constants.dart';
import 'package:digital_order_system/products/enums/alert_enum.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/products/models/service/customer_model.dart';
import 'package:digital_order_system/products/view_models/splash_view_model.dart';
import 'package:intl/intl.dart';

import '../../../products/components/information_container/informantion_container.dart';

class FoodReccomendationSystemView extends StatelessWidget with BaseSingleton {
  final pv = Provider.of<SplashViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  FoodReccomendationSystemView({super.key});

  void showInfoDialog(BuildContext context) {
    uiUtils.showAlertDialog(
      context: context,
      alertEnum: AlertEnum.INFO,
      contentTitle: "UYARI",
      contentSubtitle:
          "Lütfen kişisel resminizi yüklediğinizden veya kişisel resminiz olduğunuzdan emin olun.\nAksi halde yemek önerme sistemimiz çalışmayacaktır.",
      buttonLabel: "KAPAT",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: const Text("Yemek Önerme"),
        ),
        actions: [
          infoBtn(context),
          context.emptySizedWidthBox2x,
        ],
      ),
      body: FadeInUp(
        child: Padding(
          padding: context.padding6x,
          child: Column(
            crossAxisAlignment: context.crossAxisAStart,
            children: [
              welcomeSection(context),
              personelInformationSection(context),
              context.emptySizedHeightBox6x,
              estimateInformationContainer(context),
              const Spacer(),
              reccomendationBtn(context),
              context.emptySizedHeightBox1x,
            ],
          ),
        ),
      ),
    );
  }

  Widget infoBtn(BuildContext context) {
    return FadeInDown(
      child: IconButton(
        onPressed: () => showInfoDialog(context),
        icon: Icon(
          Icons.info,
          color: Colors.black,
          size: context.val7x,
        ),
      ),
    );
  }

  Row welcomeSection(BuildContext context) {
    return Row(
      children: [
        aiImage(),
        context.emptySizedWidthBox4x,
        Expanded(
          child: welcomeText(),
        ),
      ],
    );
  }

  FoodReccomendationContainer aiImage() {
    return FoodReccomendationContainer(
      image: DecorationImage(
        image: AssetImage(ImageConstants.ai.toJpeg),
        fit: BoxFit.cover,
      ),
    );
  }

  Text welcomeText() {
    return const Text(
      "Yapay zeka tabanlı akıllı yemek önerme sistemimize hoş geldin!",
    );
  }

  Row personelInformationSection(BuildContext context) {
    return Row(
      children: [
        userProfilePhoto(context),
        context.emptySizedWidthBox4x,
        personelInformation(context),
      ],
    );
  }

  Widget userProfilePhoto(BuildContext context) {
    // return CachedNetworkImage(
    //   imageUrl: pv.customer.imageUrl ?? "",
    // );
    return pv.customer.imageUrl != null
        ? CachedNetworkImage(
            imageUrl: pv.customer.imageUrl!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageBuilder: (context, imageProvider) =>
                FoodReccomendationContainer(
              image: DecorationImage(image: imageProvider),
            ),
          )
        : FoodReccomendationContainer(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: context.val13x,
            ),
          );
  }

  Column personelInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: context.crossAxisAStart,
      children: [
        context.emptySizedHeightBox8x,
        const Text("Kişisel Bilgileriniz"),
        context.emptySizedHeightBox1x,
        fullNameInfo(),
        context.emptySizedHeightBox1x,
        birthDayAndAgeInfo(),
        context.emptySizedHeightBox1x,
        phoneInfo(),
        context.emptySizedHeightBox1x,
        genderInfo(),
      ],
    );
  }

  FoodReccomendationPersonelInfo fullNameInfo() {
    return FoodReccomendationPersonelInfo(
      icon: Icons.person,
      text: pv.customer.fullName ?? "Bilgi Yok",
    );
  }

  FoodReccomendationPersonelInfo birthDayAndAgeInfo() {
    DateFormat dateFormat = DateFormat.yMd('tr');
    DateTime birthDate = DateTime.now();
    String formattedDate = "Bilgi Yok";
    if (pv.customer.birthDate != null) {
      birthDate = pv.customer.birthDate!.toDate();
      formattedDate = dateFormat.format(birthDate);
    }
    return FoodReccomendationPersonelInfo(
      icon: Icons.cake,
      text: "$formattedDate / ${pv.customer.age}",
    );
  }

  FoodReccomendationPersonelInfo phoneInfo() {
    return FoodReccomendationPersonelInfo(
      icon: Icons.call,
      text: pv.customer.phone ?? "Bilgi Yok",
    );
  }

  FoodReccomendationPersonelInfo genderInfo() {
    bool gender = pv.customer.gender ?? false;
    return FoodReccomendationPersonelInfo(
      icon: gender ? Icons.male : Icons.female,
      text: gender ? "Erkek" : "Bayan",
    );
  }

  InformationContainer estimateInformationContainer(BuildContext context) {
    return InformationContainer(
      icon: Icons.celebration,
      information: "Yapılan tahminler burada gözükecektir.",
      margin: EdgeInsets.zero,
      bgColor: colors.charismaticRed,
      borderRadius: context.borderRadius4x,
      padding: EdgeInsets.symmetric(
        horizontal: context.val12x,
        vertical: context.val12x * 1.2,
      ),
    );
  }

  CustomButton reccomendationBtn(BuildContext context) {
    return CustomButton(
      context: context,
      buttonType: CustomButtonEnum.small,
      label: "Yemek Öner!",
      bgColor: colors.charismaticRed,
    );
  }
}
