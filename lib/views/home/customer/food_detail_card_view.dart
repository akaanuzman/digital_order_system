import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';

import '../../../products/enums/custom_button_enum.dart';

class FoodDetailCardView extends StatelessWidget with BaseSingleton {
  const FoodDetailCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          foodImage(),
          FadeInUp(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: context.height / 1.75,
                child: BottomSheet(
                  onClosing: () {},
                  enableDrag: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: context.borderRadius15x),
                  builder: (context) {
                    return cardInformations(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget foodImage() {
    return FadeInDown(
      child: Image.asset(
        "burger".toPng,
        scale: 0.5,
      ),
    );
  }

  Widget cardInformations(BuildContext context) {
    return ListView(
      padding: context.padding6x,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        context.emptySizedHeightBox2x,
        nameAndFavIcon(context, "Chicken Burger"),
        context.emptySizedHeightBox2x,
        orderSection(context),
        context.emptySizedHeightBox2x,
        Padding(
          padding: context.paddingHorizontal4x,
          child: Text(
            "inelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düze",
            style: context.textTheme.titleLarge,
            textAlign: context.taJustify,
          ),
        ),
        context.emptySizedHeightBox2x,
        counterAndCounter(context),
        context.emptySizedHeightBox2x,
        SizedBox(
          width: context.width / 1.5,
          child: CustomButton(
            context: context,
            buttonType: CustomButtonEnum.large,
            label: "Sepete Ekle",
          ),
        )
      ],
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
              // TODO: bu textstlye'lar elle verilmeyecek texttheme'den okunacak.
              style: TextStyle(
                fontSize: context.val4x * 1.2,
                color: colors.redSavinaPepper,
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
            // TODO: bu textstlye'lar elle verilmeyecek texttheme'den okunacak.
            style: TextStyle(
              fontSize: context.val4x * 1.2,
              color: colors.redSavinaPepper,
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
          color: colors.redSavinaPepper,
        ),
      ),
    );
  }

  Widget orderSection(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontal3x,
      child: Row(
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
    );
  }

  Widget nameAndFavIcon(BuildContext context, String text) {
    return Row(
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
    );
  }
}
