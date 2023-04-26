import 'package:digital_order_system/products/components/appbar/restaurant_appbar.dart';
import 'package:digital_order_system/products/components/information_container/informantion_container.dart';

import '../../products/models/local/restaurant_management_model.dart';
import '../../_export_ui.dart';

class RestaurantHomeView extends StatelessWidget with BaseSingleton {
  const RestaurantHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: FadeInUp(
        child: Column(
          children: [
            managemenetInformationContainer(),
            managementItems(context),
          ],
        ),
      ),
    );
  }

  InformationContainer managemenetInformationContainer() {
    return const InformationContainer(
      icon: Icons.thumb_up,
      information:
          "Mağaza yönetiminizi buradan hızlı ve kolay bir şekilde yönetibilirsiniz.",
    );
  }

  AppBar appBar() {
    return RestaurantAppBar(
      title: "Mağaza Yönetimi",
    );
  }

  GridView managementItems(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: RestaurantManagementModelExtension.managements.length,
      padding: context.padding4x,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        RestaurantManagementModel item =
            RestaurantManagementModelExtension.managements[index];
        return managementItem(context, item);
      },
    );
  }

  InkWell managementItem(BuildContext context, RestaurantManagementModel item) {
    return InkWell(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.redSavinaPepper,
          borderRadius: context.borderRadius8x,
        ),
        padding: context.padding4x,
        child: Column(
          crossAxisAlignment: context.crossAxisAStart,
          children: [
            managementIcon(item, context),
            context.emptySizedHeightBox2x,
            managementTitle(item, context),
          ],
        ),
      ),
    );
  }

  Icon managementIcon(RestaurantManagementModel item, BuildContext context) {
    return Icon(
      item.icon,
      size: context.val20x,
      color: Colors.white,
    );
  }

  Text managementTitle(RestaurantManagementModel item, BuildContext context) {
    return Text(
      item.title,
      style: context.textTheme.headlineSmall!.copyWith(color: Colors.white),
    );
  }
}
