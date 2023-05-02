import 'package:digital_order_system/products/components/appbar/restaurant_appbar.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/row/row_icon_text_for_order_and_user_information.dart';

class RestaurantPastOrderDetailView extends StatelessWidget with BaseSingleton {
  const RestaurantPastOrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantAppBar(title: "Sipariş Yönetimi"),
      body: FadeInUp(
        child: ListView(
          padding: context.padding6x,
          children: [
            Text(
              "Kullanıcı Bilgileri",
              style: context.textTheme.headlineSmall,
            ),
            context.emptySizedHeightBox2x,
            userInformationContainer(context),
            context.emptySizedHeightBox4x,
            Text(
              "Sipariş Bilgileri",
              style: context.textTheme.headlineSmall,
            ),
            context.emptySizedHeightBox2x,
            orderInformatioContainer(context)
          ],
        ),
      ),
    );
  }

  Container userInformationContainer(BuildContext context) {
    return Container(
      padding: context.padding3x,
      decoration: containerDecoration(context),
      child: Row(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          userImage(context),
          context.emptySizedWidthBox3x,
          Column(
            crossAxisAlignment: context.crossAxisAStart,
            children: [
              userFullname(context),
              context.emptySizedHeightBox1x,
              userPhone(context),
              context.emptySizedHeightBox1x,
              userMail(context),
              context.emptySizedHeightBox1x,
            ],
          ),
        ],
      ),
    );
  }

  SizedBox userImage(BuildContext context) {
    return SizedBox(
      width: context.val13x,
      height: context.val13x,
      child: CircleAvatar(
        backgroundColor: colors.redSavinaPepper,
        child: Icon(
          Icons.person,
          size: context.val8x,
          color: Colors.white,
        ),
      ),
    );
  }

  Text userFullname(BuildContext context) {
    return Text(
      "Ahmet Kaan Uzman",
      style: context.textTheme.labelLarge,
    );
  }

  RowIconTextForOrderAndUserInformation userPhone(BuildContext context) {
    return RowIconTextForOrderAndUserInformation(
      context: context,
      icon: Icons.call,
      text: "+90 555 555 55",
    );
  }

  RowIconTextForOrderAndUserInformation userMail(BuildContext context) {
    return RowIconTextForOrderAndUserInformation(
      context: context,
      icon: Icons.mail,
      text: "uzmanakan@gmail.com",
    );
  }

  BoxDecoration containerDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: context.borderRadius6x,
      border: Border.all(color: colors.orochimaru),
    );
  }

  Container orderInformatioContainer(BuildContext context) {
    return Container(
      padding: context.padding6x,
      decoration: containerDecoration(context),
      child: Column(
        children: [
          foodSection(context),
          context.emptySizedHeightBox3x,
          drinkSection(context),
          context.emptySizedHeightBox3x,
          orderPrice(context),
          context.emptySizedHeightBox3x,
          orderDate(context),
        ],
      ),
    );
  }

  Row foodSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: foodName(context),
        ),
        Expanded(
          child: foodCount(context),
        ),
        Expanded(
          child: foodPrice(context),
        ),
      ],
    );
  }

  Row drinkSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: drinkName(context),
        ),
        Expanded(
          child: drinkCount(context),
        ),
        Expanded(
          child: drinkPrice(context),
        ),
      ],
    );
  }

  RowIconTextForOrderAndUserInformation foodName(BuildContext context) {
    return RowIconTextForOrderAndUserInformation(
      context: context,
      icon: Icons.fastfood,
      text: "Hamburger",
    );
  }

  RowIconTextForOrderAndUserInformation foodCount(BuildContext context) {
    return RowIconTextForOrderAndUserInformation.basket(
      context: context,
      text: "1 Adet",
    );
  }

  RowIconTextForOrderAndUserInformation foodPrice(BuildContext context) {
    return RowIconTextForOrderAndUserInformation.money(
      context: context,
      text: "80 TL",
    );
  }

  RowIconTextForOrderAndUserInformation drinkName(BuildContext context) {
    return RowIconTextForOrderAndUserInformation(
      context: context,
      icon: Icons.local_cafe,
      text: "Kola",
    );
  }

  RowIconTextForOrderAndUserInformation drinkCount(BuildContext context) {
    return RowIconTextForOrderAndUserInformation.basket(
      context: context,
      text: "1 Adet",
    );
  }

  RowIconTextForOrderAndUserInformation drinkPrice(BuildContext context) {
    return RowIconTextForOrderAndUserInformation.money(
      context: context,
      text: "10 TL",
    );
  }

  RowIconTextForOrderAndUserInformation orderPrice(BuildContext context) {
    return RowIconTextForOrderAndUserInformation(
      context: context,
      icon: Icons.savings,
      text: "Toplam: 90 TL",
    );
  }

  RowIconTextForOrderAndUserInformation orderDate(BuildContext context) {
    return RowIconTextForOrderAndUserInformation(
      context: context,
      icon: Icons.schedule,
      text: "Sipariş Tarihi: 20 Nis 2023 19.00",
    );
  }
}
