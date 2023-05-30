import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/views/home/restraurant/drink/drink_operations_view.dart';

import '../../../../products/components/appbar/restaurant_appbar.dart';
import '../../../../products/components/information_container/informantion_container.dart';
import '../../../../products/enums/alert_enum.dart';

class RestaurantDrinkView extends StatelessWidget with BaseSingleton {
  const RestaurantDrinkView({super.key});

  Future goToDrinkOperationsPage(BuildContext context,
      {bool isEdit = false}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkOperationsView(isEdit: isEdit),
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
          "İçecek yönetiminizi sağda bulunan üç noktaya tıklayarak hızlı ve kolay bir şekilde yönetibilirsiniz.",
      margin: EdgeInsets.zero,
    );
  }

  AppBar appBar(BuildContext context) {
    return RestaurantAppBar(
      title: "İçecek Yönetimi",
      actions: [
        IconButton(
          onPressed: () => goToDrinkOperationsPage(context),
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
      itemBuilder: (context, index) => drinkItem(context),
      separatorBuilder: (context, index) => context.emptySizedHeightBox2x,
      itemCount: 10,
    );
  }

  // TODO: MAKE A COMPONENT
  Card drinkItem(BuildContext context) {
    return Card(
      child: Container(
        decoration: decoration(context),
        margin: context.padding4x,
        padding: context.padding2x,
        child: ListTile(
          leading: const Icon(Icons.local_cafe),
          title: const Text("İçecek İsmi"),
          subtitle: subtitle(context),
          trailing: IconButton(
            onPressed: () => uiUtils.showEditAndDeleteAction(
              context: context,
              editOnTap: (context) async => goToDrinkOperationsPage(
                context,
                isEdit: true,
              ).then(
                (value) => Navigator.pop(context),
              ),
              deleteOnTap: (context) => uiUtils.showAlertDialog(
                context: context,
                alertEnum: AlertEnum.AREUSURE,
                contentTitle: "Emin misiniz?",
                contentSubtitle: "Kayıtlı olan içecek silinecektir.",
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
