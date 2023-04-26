import '../../../_export_ui.dart';
import '../../../products/components/appbar/restaurant_appbar.dart';
import '../../../products/components/button/custom_button.dart';
import '../../../products/components/text_field/special_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';

class FoodOperationsView extends StatelessWidget with BaseSingleton {
  final bool isEdit;
  const FoodOperationsView({
    super.key,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantAppBar(
        title: isEdit ? "Yemeği Düzenle" : "Yemek Ekle",
      ),
      body: FadeInUp(
        child: ListView(
          padding: context.padding4x,
          children: [
            context.emptySizedHeightBox2x,
            foodNameField(),
            context.emptySizedHeightBox2x,
            priceField(),
            context.emptySizedHeightBox2x,
            chooseKitchenField(),
            context.emptySizedHeightBox4x,
            imageSectionCard(context),
            context.emptySizedHeightBox4x,
            addOrEditFoodBtn(context),
          ],
        ),
      ),
    );
  }

  SpecialTextField foodNameField() {
    return const SpecialTextField(
      labelText: "Yemek Adı",
      suffixIcon: Icon(Icons.food_bank_outlined),
    );
  }

  SpecialTextField priceField() {
    return const SpecialTextField(
      labelText: "Ücret",
      suffixIcon: Icon(Icons.attach_money),
      keyboardType: TextInputType.number,
    );
  }

  SpecialTextField chooseKitchenField() {
    return const SpecialTextField(
      labelText: "Mutfak Seçiniz",
      readOnly: true,
      suffixIcon: Icon(Icons.chevron_right),
    );
  }

  // TODO: MAKE A COMPONENT
  Row imageSectionCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: imageSection(context),
        ),
        const Spacer(),
      ],
    );
  }

  GestureDetector imageSection(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            color: colors.redSavinaPepper,
            borderRadius: context.borderRadius3x,
          ),
          child: showAndDeleteImageSection(context)
          // child: uploadImageSection(context),
          ),
    );
  }

  Padding showAndDeleteImageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          ),
          Icon(
            Icons.description,
            color: Colors.white,
            size: context.val10x,
          ),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Padding uploadImageSection(BuildContext context) {
    return Padding(
      padding: context.padding4x,
      child: Column(
        children: [
          Text(
            "Yemek Resmi Yükle",
            style: context.textTheme.labelMedium!.copyWith(
              color: Colors.white,
              fontWeight: context.fw700,
            ),
          ),
          context.emptySizedHeightBox1x,
          Icon(
            Icons.add_circle,
            size: context.val7x,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  CustomButton addOrEditFoodBtn(BuildContext context) {
    return CustomButton(
      context: context,
      buttonType: CustomButtonEnum.medium,
      label: isEdit ? "Değişikleri Kaydet" : "Yemeği Ekle",
    );
  }
}
