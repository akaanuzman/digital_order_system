import 'package:digital_order_system/products/components/appbar/restaurant_appbar.dart';
import 'package:digital_order_system/products/models/local/tabbar_model.dart';
import 'package:digital_order_system/_export_ui.dart';

class RestaurantOrdersView extends StatelessWidget with BaseSingleton {
  const RestaurantOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabbarModelExtension.userNavbar.length,
      child: Scaffold(
        appBar: appBar(),
        body: tabbarView(),
      ),
    );
  }

  RestaurantAppBar appBar() {
    return RestaurantAppBar(
      title: "Sipariş Yönetimi",
      bottom: TabBar(
        tabs: TabbarModelExtension.userNavbar,
      ),
    );
  }

  TabBarView tabbarView() {
    return TabBarView(
      children: constants.restaurantOrderTabBarViews,
    );
  }
}
