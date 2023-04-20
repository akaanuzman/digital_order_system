import 'package:digital_order_system/products/models/local/restaurant_management_model.dart';
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
            managementInfoContainer(context),
            managementItems(context),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: colors.redSavinaPepper,
      title: FadeInDown(
        child: Text(
          "Mağaza Yönetimi",
          style: TextStyle(color: colors.notYoCheese),
        ),
      ),
      iconTheme: IconThemeData(color: colors.notYoCheese),
    );
  }

  Container managementInfoContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.redSavinaPepper,
        borderRadius: context.borderRadius8x,
      ),
      padding: context.padding6x,
      margin: context.padding3x,
      child: Row(
        children: [
          managementInfoIcon(context),
          context.emptySizedWidthBox3x,
          managementInfoText(context),
        ],
      ),
    );
  }

  Icon managementInfoIcon(BuildContext context) {
    return Icon(
      Icons.thumb_up,
      color: colors.notYoCheese,
      size: context.val14x,
    );
  }

  Flexible managementInfoText(BuildContext context) {
    return Flexible(
      child: Text(
        "Mağaza yönetiminizi buradan hızlı ve kolay bir şekilde yönetibilirsiniz.",
        style: context.textTheme.headlineSmall!
            .copyWith(color: colors.notYoCheese),
        maxLines: 3,
      ),
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
      color: colors.notYoCheese,
    );
  }

  Text managementTitle(RestaurantManagementModel item, BuildContext context) {
    return Text(
      item.title,
      style:
          context.textTheme.headlineSmall!.copyWith(color: colors.notYoCheese),
    );
  }
}
