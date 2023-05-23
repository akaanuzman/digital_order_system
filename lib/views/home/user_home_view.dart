import 'package:digital_order_system/views/home/food_detail_card_view.dart';

import '../../../_export_ui.dart';
import '../../products/constants/image_constants.dart';

class UserHomeView extends StatelessWidget with BaseSingleton {
  const UserHomeView({super.key});

  void goToFoodDetaislCard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FoodDetailCardView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(child: const Text("Ana Sayfa")),
        actions: [
          appBarActionsIcon(context),
        ],
      ),
      body: FadeInUp(
        child: ListView.separated(
          padding: context.padding3x,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: context.crossAxisAStart,
              children: [
                Padding(
                  padding: context.padding2x,
                  child: Text(
                    "Ana Yemek",
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.35),
                  child: GridView.builder(
                    padding: context.padding2x,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: context.width / 2,
                      crossAxisSpacing: context.val2x,
                      mainAxisSpacing: context.val2x,
                    ),
                    itemBuilder: (context, index) {
                      return gridViewContainer(
                          context, ImageConstants.mainDishes.toPng);
                    },
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => context.emptySizedHeightBox3x,
          itemCount: 4,
        ),
      ),
    );
  }

  Widget gridViewContainer(BuildContext context, String imageLabel) {
    return GestureDetector(
      onTap: () => goToFoodDetaislCard(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.borderRadius4x,
          image: DecorationImage(
            image: AssetImage(imageLabel),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget appBarActionsIcon(BuildContext context) {
    return FadeInDown(
      child: Padding(
        padding: EdgeInsets.only(right: context.val4x),
        child: Icon(
          Icons.notifications_outlined,
          size: context.val8x,
        ),
      ),
    );
  }
}
