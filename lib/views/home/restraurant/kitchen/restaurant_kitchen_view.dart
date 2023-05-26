import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/appbar/restaurant_appbar.dart';
import 'package:digital_order_system/products/components/information_container/informantion_container.dart';
import 'package:digital_order_system/products/enums/alert_enum.dart';
import 'package:digital_order_system/views/home/restraurant/kitchen/kitchen_operations_view.dart';

class RestaurantKitchenView extends StatelessWidget with BaseSingleton {
  const RestaurantKitchenView({super.key});

  Future goToKitchenOperationsPage(BuildContext context,
      {bool isEdit = false}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KitchenOperationView(isEdit: isEdit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: FadeInUp(
        child: ListView(
          padding: context.padding6x,
          children: [
            managementInfoContainer(),
            kitchenList(context),
          ],
        ),
      ),
    );
  }

  InformationContainer managementInfoContainer() {
    return const InformationContainer(
      icon: Icons.thumb_up,
      information:
          "Mutfak yönetiminizi sağda bulunan üç noktaya tıklayarak hızlı ve kolay bir şekilde yönetibilirsiniz.",
      margin: EdgeInsets.zero,
    );
  }

  AppBar appBar(BuildContext context) {
    return RestaurantAppBar(
      title: "Mutfak Yönetimi",
      actions: [
        IconButton(
          onPressed: () => goToKitchenOperationsPage(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  ListView kitchenList(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: context.val4x),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => kitchenItem(context),
      separatorBuilder: (context, index) => context.emptySizedHeightBox2x,
      itemCount: 10,
    );
  }

  Card kitchenItem(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book),
        title: const Text("Mutfak İsmi"),
        trailing: IconButton(
          onPressed: () => uiUtils.showEditAndDeleteAction(
            context: context,
            editOnTap: (context) async => goToKitchenOperationsPage(
              context,
              isEdit: true,
            ).then(
              (value) => Navigator.pop(context),
            ),
            deleteOnTap: (context) => uiUtils.showAlertDialog(
                context: context,
                alertEnum: AlertEnum.AREUSURE,
                contentTitle: "Emin misiniz?",
                contentSubtitle: "Kayıtlı olan mutfak silinecektir.",
                buttonLabel: "Evet",
                secondButtonLabel: "Hayır"),
          ),
          icon: const Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
