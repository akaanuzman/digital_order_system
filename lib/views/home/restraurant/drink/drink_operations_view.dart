import 'package:digital_order_system/_export_ui.dart';
import '../../../../products/components/appbar/restaurant_appbar.dart';
import '../../../../products/components/button/custom_button.dart';
import '../../../../products/components/text_field/special_text_field.dart';
import '../../../../products/enums/custom_button_enum.dart';

class DrinkOperationsView extends StatelessWidget with BaseSingleton {
  final bool isEdit;
  const DrinkOperationsView({
    super.key,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantAppBar(
        title: isEdit ? "İçeceği Düzenle" : "İçecek Ekle",
      ),
      body: FadeInUp(
        child: ListView(
          padding: context.padding4x,
          children: [
            context.emptySizedHeightBox2x,
            foodNameField(),
            context.emptySizedHeightBox2x,
            priceField(),
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
    return SpecialTextField(
      controller: TextEditingController(),
      labelText: "İçecek Adı",
      suffixIcon: const Icon(Icons.food_bank_outlined),
    );
  }

  SpecialTextField priceField() {
    return SpecialTextField(
      controller: TextEditingController(),
      labelText: "Ücret",
      suffixIcon: const Icon(Icons.attach_money),
      keyboardType: TextInputType.number,
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
            "İçecek Resmi Yükle",
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
      label: isEdit ? "Değişikleri Kaydet" : "İçeceği Ekle",
    );
  }
}
