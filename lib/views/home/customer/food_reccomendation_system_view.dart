import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';
import 'package:digital_order_system/products/components/container/food_reccomendation_container.dart';
import 'package:digital_order_system/products/components/row/food_reccomendation_personel_info.dart';
import 'package:digital_order_system/products/constants/_export_constants.dart';
import 'package:digital_order_system/products/enums/alert_enum.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/products/view_models/customer_view_model.dart';
import 'package:digital_order_system/products/view_models/food_reccomendation_view_model.dart';
import 'package:digital_order_system/views/home/customer/customer_food_selection_view.dart';
import 'package:intl/intl.dart';

import '../../../products/components/information_container/informantion_container.dart';

class FoodReccomendationSystemView extends StatefulWidget {
  const FoodReccomendationSystemView({super.key});

  @override
  State<FoodReccomendationSystemView> createState() =>
      _FoodReccomendationSystemViewState();
}

class _FoodReccomendationSystemViewState
    extends State<FoodReccomendationSystemView> with BaseSingleton {
  final pv = Provider.of<CustomerViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );

  final foodReccomendationVM = Provider.of<FoodReccomendationViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );

  @override
  void initState() {
    foodReccomendationVM.loadAIModelFromAsset();
    super.initState();
  }

  @override
  void dispose() {
    foodReccomendationVM.disposeModel();
    foodReccomendationVM.isComplateRecommendation = false;
    super.dispose();
  }

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

  void doEstimation() {
    uiUtils.showAlertDialog(
      context: context,
      alertEnum: AlertEnum.INFO,
      contentTitle: "UYARI",
      contentSubtitle: foodReccomendationVM.isComplateRecommendation
          ? "Lütfen tekrar önerme almak için sayfadan çıkıp tekrar giriniz."
          : "Yüzünüzün tam olarak gözüktüğü fotoğraf yüklemeye özen gösterin aksi takdirde sistem doğru sonuç vermemektedir.",
      buttonLabel: "KAPAT",
      onTap: foodReccomendationVM.isComplateRecommendation
          ? null
          : () async {
              Navigator.pop(context);
              await foodReccomendationVM
                  .imageClassification(pv.currentCustomer.imageUrl ?? "");
            },
    );
  }

  void goToFoodSelectionPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomerFoodSelectionView(),
      ),
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
        child: ListView(
        padding: context.padding6x,
          children: [
            welcomeControl(),
            personelInformationSection(context),
            estimationControl(),
            context.emptySizedHeightBox4x,
            chooseFavFoodBtn(),
            context.emptySizedHeightBox2x,
            reccomendationBtn(context),
            context.emptySizedHeightBox1x,
          ],
        ),
      ),
    );
  }

  Consumer<FoodReccomendationViewModel> welcomeControl() {
    return Consumer<FoodReccomendationViewModel>(
      builder: (context, pv, _) {
        return pv.isComplateRecommendation
            ? const SizedBox()
            : welcomeSection(context);
      },
    );
  }

  Consumer<FoodReccomendationViewModel> estimationControl() {
    return Consumer<FoodReccomendationViewModel>(
      builder: (context, pv, _) {
        return pv.isComplateRecommendation
            ? estimationSection(context, pv)
            : estimateInformationContainer(context);
      },
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

  Column estimationSection(
      BuildContext context, FoodReccomendationViewModel pv) {
    return Column(
      children: [
        context.emptySizedHeightBox4x,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            estimationImage(context),
            context.emptySizedWidthBox4x,
            estimationDatas(context, pv),
          ],
        ),
        context.emptySizedHeightBox4x,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodReccomendationContainer(
              child: Icon(
                Icons.bar_chart,
                color: Colors.white,
                size: context.val13x,
              ),
            ),
            context.emptySizedWidthBox4x,
            Column(
              crossAxisAlignment: context.crossAxisAStart,
              children: [
                const Text("Önerme Sonuçları"),
                context.emptySizedHeightBox1x,
                Text(
                    "Eşleşme Skoru: %${foodReccomendationVM.matchRate.toStringAsFixed(1)}"),
                context.emptySizedHeightBox1x,
                Column(
                  crossAxisAlignment: context.crossAxisAStart,
                  children: recommendedFoods(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  FoodReccomendationContainer estimationImage(BuildContext context) {
    return FoodReccomendationContainer(
      child: Icon(
        Icons.insights,
        color: Colors.white,
        size: context.val13x,
      ),
    );
  }

  Column estimationDatas(BuildContext context, FoodReccomendationViewModel pv) {
    return Column(
      crossAxisAlignment: context.crossAxisAStart,
      children: [
        const Text("Tahmin Sonuçları"),
        context.emptySizedHeightBox1x,
        estimationAgeGroup(pv),
        context.emptySizedHeightBox1x,
        estimationAge(pv),
        context.emptySizedHeightBox1x,
        estimationGender(pv),
        context.emptySizedHeightBox1x,
      ],
    );
  }

  FoodReccomendationPersonelInfo estimationAgeGroup(
      FoodReccomendationViewModel pv) {
    return FoodReccomendationPersonelInfo(
      icon: Icons.group,
      text: "%${pv.getConfidence()} ${pv.getAgeEstimation(isGroup: true)}",
    );
  }

  FoodReccomendationPersonelInfo estimationAge(FoodReccomendationViewModel pv) {
    return FoodReccomendationPersonelInfo(
      icon: Icons.cake,
      text: "%${pv.getConfidence()} ${pv.getAgeEstimation()}",
    );
  }

  FoodReccomendationPersonelInfo estimationGender(
      FoodReccomendationViewModel pv) {
    return FoodReccomendationPersonelInfo(
      icon: pv.isGender ? Icons.male : Icons.female,
      text:
          "%${pv.getConfidence(isAgeEstimation: false)} ${pv.getGenderEstimation}",
    );
  }

  List<Widget> recommendedFoods(BuildContext context) {
    return List.generate(
      foodReccomendationVM.suggestions.length,
      (index) {
        var item = foodReccomendationVM.suggestions[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.val1x),
          child: FoodReccomendationPersonelInfo(
            icon: Icons.fastfood,
            text: item,
          ),
        );
      },
    );
  }

  Widget welcomeSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            aiImage(),
            context.emptySizedWidthBox4x,
            Expanded(
              child: welcomeText(),
            ),
          ],
        ),
        context.emptySizedHeightBox4x,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userProfilePhoto(context),
        context.emptySizedWidthBox4x,
        personelInformation(context),
      ],
    );
  }

  Widget userProfilePhoto(BuildContext context) {
    return pv.currentCustomer.imageUrl != null
        ? profilePhoto()
        : emptyPhoto(context);
  }

  CachedNetworkImage profilePhoto() {
    return CachedNetworkImage(
      imageUrl: pv.currentCustomer.imageUrl!,
      placeholder: (context, url) => const CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) => FoodReccomendationContainer(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  FoodReccomendationContainer emptyPhoto(BuildContext context) {
    return FoodReccomendationContainer(
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: context.val13x,
      ),
    );
  }

  Widget personelInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: context.crossAxisAStart,
      children: [
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
      text: pv.currentCustomer.fullName ?? "Bilgi Yok",
    );
  }

  FoodReccomendationPersonelInfo birthDayAndAgeInfo() {
    DateFormat dateFormat = DateFormat.yMd('tr');
    DateTime birthDate = DateTime.now();
    String formattedDate = "Bilgi Yok";
    if (pv.currentCustomer.birthDate != null) {
      birthDate = pv.currentCustomer.birthDate!;
      formattedDate = dateFormat.format(birthDate);
    }
    return FoodReccomendationPersonelInfo(
      icon: Icons.cake,
      text: "$formattedDate / ${pv.currentCustomer.age}",
    );
  }

  FoodReccomendationPersonelInfo phoneInfo() {
    return FoodReccomendationPersonelInfo(
      icon: Icons.call,
      text: pv.currentCustomer.phone ?? "Bilgi Yok",
    );
  }

  FoodReccomendationPersonelInfo genderInfo() {
    bool gender = pv.currentCustomer.gender ?? false;
    return FoodReccomendationPersonelInfo(
      icon: gender ? Icons.male : Icons.female,
      text: gender ? "Erkek" : "Bayan",
    );
  }

  Widget estimateInformationContainer(BuildContext context) {
    return Column(
      children: [
        context.emptySizedHeightBox6x,
        InformationContainer(
          icon: Icons.celebration,
          information: "Yapılan tahminler burada gözükecektir.",
          margin: EdgeInsets.zero,
          bgColor: colors.charismaticRed,
          borderRadius: context.borderRadius4x,
          padding: context.padding12x,
        ),
      ],
    );
  }

  Consumer<FoodReccomendationViewModel> chooseFavFoodBtn() {
    return Consumer<FoodReccomendationViewModel>(
      builder: (context, pv, _) {
        return Visibility(
          visible: pv.isComplateRecommendation ? false : true,
          child: CustomButton(
            context: context,
            buttonType: CustomButtonEnum.small,
            label: "Favori yemeğini seç!",
            bgColor: colors.charismaticRed,
            onTap: () => goToFoodSelectionPage(context),
          ),
        );
      },
    );
  }

  Widget reccomendationBtn(BuildContext context) {
    return Consumer<FoodReccomendationViewModel>(
      builder: (context, foodReccomendationVM, _) {
        return CustomButton(
          context: context,
          buttonType: CustomButtonEnum.small,
          label: foodReccomendationVM.isComplateRecommendation
              ? "Önerme tamamlandı!"
              : "Yemek Öner!",
          bgColor: colors.charismaticRed,
          onTap: () => doEstimation(),
        );
      },
    );
  }
}
