import 'package:digital_order_system/products/components/card/order_card.dart';
import 'package:digital_order_system/products/components/list_view/custom_listview.dart';
import 'package:digital_order_system/products/view_models/customer_basket_view_model.dart';
import '../../../_export_ui.dart';

class CustomerBasketView extends StatelessWidget with BaseSingleton {
  const CustomerBasketView({super.key});

  @override
  Widget build(BuildContext context) {
    final hpv = Provider.of<CustomerBasketViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(
            "Sepetiniz",
            // TODO:Default olarka appbar title'e özel texttheme var kaldırılmalı
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.val6x,
            ),
          ),
        ),
      ),
      body: FadeInUp(
        child: ListView(
          children: [
            ListView.separated(
              padding: context.padding2x,
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
              child: const OrderCardView(),
            ),
          ],
        ),
      ),
    );
  }
}
