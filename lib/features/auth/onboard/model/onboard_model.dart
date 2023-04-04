import 'package:digital_order_system/core/extensions/string_extension.dart';

class OnboardModel {
  final String imageUrl;
  final String title;
  final String subtitle;

  OnboardModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

extension OnboardModelExtension on OnboardModel {
  //TODO: ADD LANG LANGUAGE FILE
    static List<OnboardModel> get pages => [
        OnboardModel(
          imageUrl: "onboarding0".toPng,
          title: "Uygulamamıza hoşgeldin!",
          subtitle: "Halihazırda bulunan bir çok zengin içerik ve özellik için devam et!",
        ),
        OnboardModel(
          imageUrl: "onboarding1".toPng,
          title: "Haydi sıra sende!",
          subtitle: "Müşteriler ve sizler için tasarladığımız bir çok şeyi keşfet!",
        ),
        OnboardModel(
          imageUrl: "onboarding2".toPng,
          title: "Son bir adım!",
          subtitle: "Restoran hesabını oluştur ve sipariş yönetimindeki performansı maksimuma çıkar.",
        ),
      ];
}
