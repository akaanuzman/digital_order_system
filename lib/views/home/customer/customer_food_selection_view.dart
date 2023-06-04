import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';
import 'package:digital_order_system/products/components/text_field/special_text_field.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/products/models/service/reccomendation_foods_model.dart';
import 'package:digital_order_system/products/view_models/food_reccomendation_view_model.dart';

class CustomerFoodSelectionView extends StatelessWidget {
  final pv = Provider.of<FoodReccomendationViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  CustomerFoodSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: const Text("Favori Yemeğini Seç"),
        ),
        leading: IconButton(
          onPressed: () {
            pv.onDispose();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: FadeInUp(
        child: Stack(
          children: [
            searchAndFoodList(context),
            saveBtn(context),
          ],
        ),
      ),
    );
  }

  Column searchAndFoodList(BuildContext context) {
    return Column(
      children: [
        serachField(context),
        Expanded(
          flex: 6,
          child: foodList(context),
        ),
      ],
    );
  }

  Padding serachField(BuildContext context) {
    return Padding(
      padding: context.padding4x,
      child: SpecialTextField(
        controller: pv.searchController,
        labelText: "Yemek ara",
        prefixIcon: const Icon(Icons.search),
        fillColor: Colors.white,
        filled: true,
        onChanged: pv.searchReccomendationFoods,
      ),
    );
  }

  Widget foodList(BuildContext context) {
    return Consumer<FoodReccomendationViewModel>(
      builder: (context, pv, _) {
        var itemCount = pv.searchController.text.isNotEmpty
            ? pv.searchReccomendationFoodsList.length
            : pv.reccomendationFoods.length;
        return ListView.separated(
          padding: context.padding4x,
          itemBuilder: (_, index) {
            ReccomendationFoodsModel food = ReccomendationFoodsModel();
            if (pv.searchController.text.isNotEmpty) {
              food = pv.searchReccomendationFoodsList[index];
            } else {
              food = pv.reccomendationFoods[index];
            }
            return foodItem(context, food);
          },
          separatorBuilder: (_, index) {
            return context.emptySizedHeightBox2x;
          },
          itemCount: itemCount,
        );
      },
    );
  }

  Card foodItem(BuildContext context, ReccomendationFoodsModel food) {
    return Card(
      color: Colors.white,
      child: CheckboxListTile(
        contentPadding: context.paddingHorizontal5x,
        title: Text(
          food.foodName ?? "null",
          style: context.textTheme.labelLarge,
        ),
        subtitle: Text(
          food.categoryName ?? "null",
          style: context.textTheme.labelMedium,
        ),
        value: food.isSelectedDTO,
        onChanged: (val) => pv.selectReccomendationFood(food),
      ),
    );
  }

  Align saveBtn(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        padding: context.padding8x,
        child: CustomButton(
          context: context,
          buttonType: CustomButtonEnum.small,
          label: "Değişikleri kaydet!",
          onTap: () => pv.chooseReccomendationFoodsValidator,
        ),
      ),
    );
  }
}
