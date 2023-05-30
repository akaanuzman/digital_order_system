import '../../../../_export_ui.dart';

class MyFavouritesViewPage extends StatelessWidget {
  const MyFavouritesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Favorilerim",
          style: TextStyle(
            fontSize: context.val6x,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            size: context.val8x,
          ),
        ],
      ),
      body: specialListViewSeperated(context, "Burger & Fries", "30"),
    );
  }

  ListView specialListViewSeperated(
      BuildContext context, String title, String subTitle) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset("assets/images/burger_circle.png"),
          title: Text(
            title,
            style: context.textTheme.bodyLarge,
          ),
          subtitle: Text(
            "$subTitle ₺",
            style: context.textTheme.bodyLarge,
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.red.shade100,
            child: const Icon(
              Icons.favorite,
              color: Color(
                0xffF10027,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: [
            context.emptySizedHeightBox2x,
            Container(
              // padding: context.paddingHorizontal10x,
              height: context.val1x / 5,
              // width: context.val24x * 3.7,
              color: const Color(0xffD6D6D6),
            ),
            context.emptySizedHeightBox2x,
          ],
        );
      },
      itemCount: 4,
    );
  }
}
