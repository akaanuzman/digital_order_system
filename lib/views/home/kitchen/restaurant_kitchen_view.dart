import 'package:digital_order_system/_export_ui.dart';

class RestaurantKitchenView extends StatelessWidget with BaseSingleton {
  const RestaurantKitchenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: context.padding6x,
        children: [
          managementInfoContainer(context),
          ListView.separated(
            padding: EdgeInsets.only(top: context.val4x),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Mutfak İsmi"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ),
            ),
            separatorBuilder: (context, index) => context.emptySizedHeightBox2x,
            itemCount: 10,
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: colors.redSavinaPepper,
      title: FadeInDown(
        child: Text(
          "Mutfak Yönetimi",
          style: TextStyle(color: colors.notYoCheese),
        ),
      ),
      iconTheme: IconThemeData(color: colors.notYoCheese),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  //TODO: MAKE A COMPONENT
  Container managementInfoContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.redSavinaPepper,
        borderRadius: context.borderRadius8x,
      ),
      padding: context.padding6x,
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
        "Mutfak yönetiminizi sağda bulunan üç noktaya tıklayarak hızlı ve kolay bir şekilde yönetibilirsiniz.",
        style: context.textTheme.headlineSmall!
            .copyWith(color: colors.notYoCheese),
        maxLines: 5,
      ),
    );
  }
}
