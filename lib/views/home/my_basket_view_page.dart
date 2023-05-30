import 'package:digital_order_system/products/components/card/order_card.dart';
import 'package:digital_order_system/products/components/list_view/custom_listview.dart';
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
              return CustomListView(
                title: "Burger & Fries",
                price: "30",
                time: "4:00",
                hpv: hpv,
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
}
