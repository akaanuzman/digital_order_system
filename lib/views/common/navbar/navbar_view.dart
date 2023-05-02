import '../../../_export_ui.dart';
import '../../../products/view_models/navbar_view_model.dart';

class NavbarView extends StatelessWidget with BaseSingleton {
  final pv = Provider.of<UserSelectionViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );
  NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarViewModel>(
      builder: (_, NavbarViewModel provider, __) {
        return Scaffold(
          body: provider.views(pv.isUser).elementAt(provider.currentIndex),
          bottomNavigationBar: _navbarItems(context, provider),
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
          items: provider.items(pv.isUser),
          currentIndex: provider.currentIndex,
          onTap: (index) => provider.onItemTapped(index),
        ),
      ),
    );
  }
}
