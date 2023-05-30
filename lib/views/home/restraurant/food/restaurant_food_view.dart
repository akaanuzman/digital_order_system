import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/views/home/restraurant/food/food_operations_view.dart';

import '../../../../products/components/appbar/restaurant_appbar.dart';
import '../../../../products/components/information_container/informantion_container.dart';
import '../../../../products/enums/alert_enum.dart';

class RestaurnatFoodView extends StatelessWidget with BaseSingleton {
  const RestaurnatFoodView({super.key});

  Future goToFoodOperationsPage(BuildContext context,
      {bool isEdit = false}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodOperationsView(isEdit: isEdit),
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
            foodList(context),
          ],
        ),
      ),
    );
  }

  InformationContainer managementInfoContainer() {
    return const InformationContainer(
      icon: Icons.thumb_up,
      information:
          "Yemek yönetiminizi sağda bulunan üç noktaya tıklayarak hızlı ve kolay bir şekilde yönetibilirsiniz.",
      margin: EdgeInsets.zero,
    );
  }

  AppBar appBar(BuildContext context) {
    return RestaurantAppBar(
      title: "Yemek Yönetimi",
      actions: [
        IconButton(
          onPressed: () => goToFoodOperationsPage(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  ListView foodList(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: context.val4x),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => foodItem(context),
      separatorBuilder: (context, index) => context.emptySizedHeightBox2x,
      itemCount: 10,
    );
  }

  Card foodItem(BuildContext context) {
    return Card(
      child: Container(
        decoration: decoration(context),
        margin: context.padding4x,
        padding: context.padding2x,
        child: ListTile(
          leading: const Icon(Icons.fastfood),
          title: const Text("Yemek İsmi"),
          subtitle: subtitle(context),
          trailing: IconButton(
            onPressed: () => uiUtils.showEditAndDeleteAction(
              context: context,
              editOnTap: (context) async => goToFoodOperationsPage(
                context,
                isEdit: true,
              ).then(
                (value) => Navigator.pop(context),
              ),
              deleteOnTap: (context) => uiUtils.showAlertDialog(
                context: context,
                alertEnum: AlertEnum.AREUSURE,
                contentTitle: "Emin misiniz?",
                contentSubtitle: "Kayıtlı olan yemek silinecektir.",
                buttonLabel: "Evet",
                secondButtonLabel: "Hayır",
              ),
            ),
            icon: const Icon(Icons.more_horiz),
          ),
        ),
      ),
    );
  }

  BoxDecoration decoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 3,
      ),
      borderRadius: context.borderRadius3x,
    );
  }

  Column subtitle(BuildContext context) {
    return Column(
      crossAxisAlignment: context.crossAxisAStart,
      children: [
        const Text("Fiyat: 50 TL "),
        const Text("Sipariş Adeti: 100"),
        const Text("Beğeni Sayısı: 25"),
        context.emptySizedWidthBox2x,
      ],
    );
  }
}
