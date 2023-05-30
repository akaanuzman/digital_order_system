import '../../../_export_ui.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

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
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                color: const Color(0xffF10027),
                fontSize: context.val4x,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          specialListTile(
            context,
            "CAMILA WILSON",
            "555 555 55 55",
          ),
          Container(
            height: context.val1x / 5,
            width: context.val24x * 3.7,
            color: const Color(0xffD6D6D6),
          ),
          specialRow(
            context,
            Icons.mail_outline_outlined,
            "Paulwalker@gmail.com",
          ),
          context.emptySizedHeightBox5x,
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
    );
  }

  Widget specialListTile(
    BuildContext context,
    String title,
    String subTitle,
  ) {
    return ListTile(
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
