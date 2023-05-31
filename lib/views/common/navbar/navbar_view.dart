import 'package:digital_order_system/views/home/customer_basket_view.dart';

import '../../../_export_ui.dart';
import '../../../products/view_models/navbar_view_model.dart';

class NavbarView extends StatelessWidget with BaseSingleton {
  final pv = Provider.of<UserSelectionViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  NavbarView({super.key});

  void goToCartView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomerBasketView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarViewModel>(
      builder: (_, NavbarViewModel provider, __) {
        return Scaffold(
          body: provider.views(pv.isCustomer).elementAt(provider.currentIndex),
          bottomNavigationBar: _navbarItems(context, provider),
          floatingActionButton: fabButton(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _navbarItems(BuildContext context, NavbarViewModel provider) {
    return FadeInUp(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: context.radius6x,
          topLeft: context.radius6x,
        ),
        child: BottomNavigationBar(
          items: provider.items(pv.isCustomer),
          currentIndex: provider.currentIndex,
          onTap: (index) => provider.onItemTapped(index),
        ),
      ),
    );
  }

  FloatingActionButton fabButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => goToCartView(context),
      child: Icon(
        Icons.shopping_cart,
        color: colors.redSavinaPepper,
      ),
    );
  }
}
