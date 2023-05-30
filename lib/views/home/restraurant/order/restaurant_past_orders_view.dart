import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/row/row_icon_text.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/views/home/restraurant/order/restaurant_order_detail_view.dart';

import '../../../../products/components/button/custom_button.dart';

class RestaurantPastOrdersView extends StatelessWidget with BaseSingleton {
  const RestaurantPastOrdersView({super.key});

  void goToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RestaurantOrderDetailView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: ListView.separated(
          padding: context.padding4x,
          itemBuilder: (context, index) {
            return orderItem(context);
          },
          separatorBuilder: (_, __) => context.emptySizedHeightBox3x,
          itemCount: 15,
        ),
      ),
    );
  }

  Container orderItem(BuildContext context) {
    return Container(
      width: context.maxFinite,
      decoration: orderContainerItemDecoration(context),
      child: ListTile(
        iconColor: colors.withOpacity(
          color: colors.textColor,
          opacity: 0.6,
        ),
        textColor: colors.textColor,
        leading: orderImage(context),
        title: Column(
          crossAxisAlignment: context.crossAxisAStart,
          children: [
            context.emptySizedHeightBox1x,
            orderFoodAndDrinkName(context),
            context.emptySizedHeightBox1x,
            orderDate(),
            context.emptySizedHeightBox1x,
            orderPrice(),
            context.emptySizedHeightBox1x,
            orderCount(),
            context.emptySizedHeightBox1x,
            orderTableNumber(),
            context.emptySizedHeightBox2x,
            orderDetailBtn(context),
            context.emptySizedHeightBox1x,
          ],
        ),
      ),
    );
  }

  BoxDecoration orderContainerItemDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: context.borderRadius7x,
      border: Border.all(color: colors.orochimaru),
    );
  }

  SizedBox orderImage(BuildContext context) {
    return SizedBox(
      width: context.val13x,
      height: context.val13x,
      child: const CircleAvatar(),
    );
  }

  Text orderFoodAndDrinkName(BuildContext context) {
    return Text(
      "Yemek adı - İçecek varsa içecek adı",
      style: context.textTheme.headlineSmall,
    );
  }

  RowIconText orderDate() {
    return const RowIconText(
      icon: Icons.schedule,
      text: "20 Nis 2023 15.00",
    );
  }

  RowIconText orderPrice() {
    return const RowIconText(
      icon: Icons.attach_money,
      text: "30",
    );
  }

  RowIconText orderCount() {
    return const RowIconText(
      icon: Icons.shopping_bag_outlined,
      text: "2",
    );
  }

  RowIconText orderTableNumber() {
    return const RowIconText(
      icon: Icons.table_bar,
      text: "10 Numaralı Masa",
    );
  }

  Align orderDetailBtn(BuildContext context) {
    return Align(
      alignment: context.alignmentCenterRight,
      child: SizedBox(
        width: context.dynamicWidth(0.5),
        child: CustomButton(
          context: context,
          buttonType: CustomButtonEnum.small,
          label: "Detay Gör",
          onTap: () => goToDetailPage(context),
        ),
      ),
    );
  }
}
