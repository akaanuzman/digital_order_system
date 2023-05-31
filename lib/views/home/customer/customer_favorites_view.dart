import '../../../../../_export_ui.dart';

class CustomerFavoritesView extends StatelessWidget {
  const CustomerFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text(
            "Favorilerim",
            // TODO:Default olarka appbar title'e özel texttheme var kaldırılmalı
            style: TextStyle(
              fontSize: context.val6x,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: FadeInUp(
        child: specialListViewSeperated(context, "Burger & Fries", "30"),
      ),
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
              // TODO: colors. diyerek ColorConstants sınıfından color'u çekelim
              // TODO: eğer ColorConstants sınıfında böyle bir renk yoksa ekleyelim.
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
              // TODO: Yorum satırlarınız temizleyelim.
              // padding: context.paddingHorizontal10x,
              height: context.val1x / 5,
              // width: context.val24x * 3.7,
              // TODO: colors. diyerek ColorConstants sınıfından color'u çekelim
              // TODO: eğer ColorConstants sınıfında böyle bir renk yoksa ekleyelim.
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
