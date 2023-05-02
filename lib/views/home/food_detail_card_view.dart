import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';

import '../../products/enums/custom_button_enum.dart';

class FoodDetailCardView extends StatelessWidget with BaseSingleton {
  const FoodDetailCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          foodImage(),
          whiteContainer(context),
        ],
      ),
    );
  }

  Widget whiteContainer(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: context.val15x * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.val8x),
          color: Colors.white,
        ),
        child: Column(
          children: [
            nameAndFavIcon(context, "Chicken Burger"),
            context.emptySizedHeightBox2x,
            orderSection(context),
            context.emptySizedHeightBox1x,
            const Text(
                "jaspodjaspdjapsjdpaosjdpajsdpajspdjajdaposjdpoasjdpoajsdpjaspdjasdjpsadjpasjdpasjdpasjdopasjodjasoj"),
            context.emptySizedHeightBox2x,
            counterAndCounter(context),
            context.emptySizedHeightBox2x,
            Padding(
              padding: context.paddingHorizontal15x,
              child: CustomButton(
                context: context,
                buttonType: CustomButtonEnum.medium,
                label: "Sepete Ekle",
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget counterAndCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            context.emptySizedWidthBox7x,
            addRemoveIcon(
              context,
              Icons.remove,
            ),
            context.emptySizedWidthBox2x,
            Text(
              "1",
              style: TextStyle(
                fontSize: context.val4x * 1.2,
              ),
            ),
            context.emptySizedWidthBox2x,
            addRemoveIcon(
              context,
              Icons.add,
            ),
          ],
        ),
        // ignore: prefer_const_constructors
        Padding(
          padding: EdgeInsets.only(right: context.val15x),
          child: Text(
            "₺12",
            style: TextStyle(
              fontSize: context.val4x * 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Container addRemoveIcon(BuildContext context, IconData icon) {
    return Container(
      height: context.val9x,
      width: context.val9x,
      decoration: BoxDecoration(
        color: colors.circleColor,
        borderRadius: BorderRadius.circular(context.val4x),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: context.val5x,
        ),
      ),
    );
  }

  Widget foodImage() {
    return Image.asset(
      "burger".toPng,
      scale: 0.5,
    );
  }

  Widget orderSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.val7x),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_bag_rounded,
                color: colors.redSavinaPepper,
              ),
              context.emptySizedWidthBox1x,
              Text(
                "2000 + Order",
                style: context.textTheme.displaySmall!
                    .copyWith(fontSize: context.val4x),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget nameAndFavIcon(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(top: context.val10x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: context.textTheme.displayMedium!
                .copyWith(color: colors.textColor),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: colors.circleColor,
                child: Icon(
                  Icons.location_on,
                  color: colors.redSavinaPepper,
                ),
              ),
              context.emptySizedWidthBox1x,
              CircleAvatar(
                backgroundColor: colors.circleColor,
                child: Icon(
                  Icons.favorite,
                  color: colors.redSavinaPepper,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
