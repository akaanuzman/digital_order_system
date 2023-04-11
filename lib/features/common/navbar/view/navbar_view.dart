import '../../../../_export_ui.dart';
import '../viewmodel/navbar_view_model.dart';

class NavbarView extends StatelessWidget with BaseSingleton {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarViewModel>(
      builder: (_, NavbarViewModel provider, __) {
        return Scaffold(
          body: provider.views.elementAt(provider.currentIndex),
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
          items: provider.items,
          currentIndex: provider.currentIndex,
          onTap: (index) => provider.onItemTapped(index),
        ),
      ),
    );
  }
}
