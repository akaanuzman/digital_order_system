import 'package:digital_order_system/products/enums/custom_button_enum.dart';

import '../../../_export_ui.dart';
import '../button/custom_outlined_button.dart';

class OrderCardView extends StatelessWidget with BaseSingleton {
  const OrderCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding6x,
      height: context.val24x * 2.8,
      decoration: BoxDecoration(
        color: colors.redSavinaPepper,
        borderRadius: context.borderRadius6x,
      ),
      child: Column(
        children: [
          cardRow(
            context: context,
            title: "Sub - Total",
            price: "120",
          ),
          context.emptySizedHeightBox1x,
          cardRow(
            context: context,
            title: "Delivery Charge",
            price: "10",
          ),
          context.emptySizedHeightBox1x,
          cardRow(
            context: context,
            title: "Discount",
            price: "20",
          ),
          context.emptySizedHeightBox4x,
          cardRow(
            context: context,
            title: "Total",
            price: "150",
            style: context.textTheme.headlineMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          context.emptySizedHeightBox3x,
          CustomOutlinedButton(
            context: context,
            buttonType: CustomButtonEnum.medium,
            label: "Place My Order",
          ),
        ],
      ),
    );
  }

  Widget cardRow({
    required BuildContext context,
    required String title,
    required String price,
    TextStyle? style,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style ??
              const TextStyle(
                color: Colors.white,
              ),
        ),
        Text(
          "$price ₺",
          style: style ??
              const TextStyle(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
