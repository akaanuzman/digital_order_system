import 'package:digital_order_system/products/components/card/order_card.dart';
import 'package:digital_order_system/products/constants/image_constants.dart';
import 'package:digital_order_system/products/view_models/my_basket_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../_export_ui.dart';

class MyBasketViewPage extends StatelessWidget with BaseSingleton {
  const MyBasketViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hpv = Provider.of<MyBasketViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          "Your Card",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.val6x,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_outlined,
            size: context.val9x,
          ),
          context.emptySizedWidthBox4x
        ],
      ),
      body: ListView(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return context.emptySizedHeightBox1x;
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return myBasketProduct(
                context,
                "Burger & Fries",
                "₺30",
                "4:00 PM",
                hpv,
              );
            },
          ),
          context.emptySizedHeightBox4x,
          Padding(
            padding: context.paddingHorizontal6x,
            child: OrderCardView(),
          ),
        ],
      ),
    );
  }

  Widget myBasketProduct(
    BuildContext context,
    String title,
    String price,
    String time,
    MyBasketViewModel hpv,
  ) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.val3x,
          bottom: context.val3x,
        ),
        child: ListTile(
          leading: Image.asset("assets/images/hamburger.png"),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            price,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: SizedBox(
            width: context.val19x,
            child: Column(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                context.emptySizedHeightBox1x,
                Row(
                  children: [
                    circleAvatarIcon(
                      context,
                      Icons.remove,
                      colors.redSavinaPepper,
                      Colors.red.shade100,
                      () {
                        hpv.decreaseCounter;
                      },
                    ),
                    context.emptySizedWidthBox2x,
                    Consumer<MyBasketViewModel>(
                      builder: (context, hpv, _) => Text(
                        "${hpv.counter}",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    context.emptySizedWidthBox2x,
                    circleAvatarIcon(
                      context,
                      Icons.add,
                      Colors.white,
                      colors.redSavinaPepper,
                      () {
                        hpv.increaseCounter;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar circleAvatarIcon(
    BuildContext context,
    IconData icon,
    Color color,
    Color circleColor,
    void Function()? onPressed,
  ) {
    return CircleAvatar(
      backgroundColor: circleColor,
      radius: context.val3x,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed ?? () {},
        icon: Icon(
          icon,
          size: context.val5x,
          color: color,
        ),
      ),
    );
  }
}
