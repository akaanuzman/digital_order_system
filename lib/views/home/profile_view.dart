import '../../../_export_ui.dart';

// TODO: Buradaki elle girilen profil bilgilerini CustomerViewModel sınıfından okuyarak bu ekrana bağlayalım.
class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          child: Text("Profil Bilgilerim"),
        ),
      ),
      body: FadeInUp(
        child: Column(
          children: [
            specialListTile(
              context,
              "CAMILA WILSON",
              "555 555 55 55",
            ),
            // TODO: container kullanmak yerine divider kullanılmalı
            Container(
              height: context.val1x / 5,
              width: context.val24x * 10,
              color: const Color(0xffD6D6D6),
            ),
            specialRow(
              context,
              Icons.mail_outline_outlined,
              "Paulwalker@gmail.com",
            ),
            context.emptySizedHeightBox5x,
            // TODO: Paddingleri bu şekilde only olarak vermemeye çalışalım
            Padding(
              padding: EdgeInsets.only(left: context.val5x),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Ayarlar",
                  style: TextStyle(
                    fontSize: context.val4x,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            specialRow(
              context,
              Icons.home_outlined,
              "Profil Düzenle",
            ),
            specialRow(
              context,
              Icons.logout,
              "Çıkış Yap",
            )
          ],
        ),
      ),
    );
  }

  Widget specialListTile(
    BuildContext context,
    String title,
    String subTitle,
  ) {
    return ListTile(
      // TODO: Burada firebase'den dönen iamgeurl için image.asset yerine cachenetwork image'ı kullanamayı dene.
      // TODO: örnek sayfa: food_reccomendation_system_view.dart satır 231 metod adı userProfilePhoto
      leading: Image.asset("assets/images/bio.png"),
      title: Text(
        title,
        style: context.textTheme.labelLarge,
      ),
      subtitle: Text(
        subTitle,
        style: context.textTheme.titleMedium,
      ),
    );
  }

  Widget specialRow(
    BuildContext context,
    IconData icon,
    String text,
  ) {
    // TODO: Paddingleri bu şekilde vermeden tasarım yapalım ve bu rowları tıklanılabilir hale getirelim.
    return Padding(
      padding: EdgeInsets.only(
        left: context.val4x,
        top: context.val3x,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          context.emptySizedWidthBox3x,
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
