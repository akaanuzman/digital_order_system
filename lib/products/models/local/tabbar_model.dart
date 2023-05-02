import 'package:digital_order_system/_export_ui.dart';

class TabbarModel extends Tab {
  TabbarModel({
    super.key,
    required String label,
    required IconData icon,
  }) : super(
          icon: Icon(icon),
          text: label,
        );
}

extension TabbarModelExtension on TabbarModel {
  static List<TabbarModel> userNavbar = [
    TabbarModel(
      label: "Geçmiş Siparişler",
      icon: Icons.shopify_rounded,
    ),
    TabbarModel(
      label: "Güncel Siparişler",
      icon: Icons.shopping_basket_sharp,
    ),
  ];
}
