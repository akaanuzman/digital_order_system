## 🍽️ Self Servis Dijital Sipariş Sistemi 🇹🇷

### 🗒️ Proje Hakkında 
* Bu tez projesi ben ve arkadaşım [Alperen Akarslan](https://github.com/alperenakarslan) ile geliştirilmiş olup 2022-2023 Bahar Dönemi sonunda Düzce Üniversitesi Bilgisayar Mühendisliği akademisyenlerinin beğenisine sunulacaktır. Projenin amacı restoranlarda bulunan garson ihtiyacını kaldırmak ve bu sürecin mobil uygulama üzerinden hızlı ve kolay bir şekilde yapılmasını sağlmaktır. Ayrıca müşterilerin oluşturdukları hesaplarına yükledikleri kişisel resimlerine göre görüntü işleme ve derin öğrneme teknikleri (CNN) kullanılarak kişiinin yaş, popülasyon grubu ve yaş aralığı özelliklerinin çıkarımını yapmaktadır. Kararlı eşleşme algoritması aracılığıyla yemek tüketimi veri setimizdeki veriler ile kullanıcının seçmiş olduğu favori yemekleri eşleşmektedir ve buna göre yemek önerisini yapmaktadır.

* Uygulamada restoran ve kullanıcı girişi olmak üzere iki farklı girişi bulunmaktadır. Restoran sahipleri restoran hesabı oluşturarak kendi işletmelerini uygulamamıza ekleyebilmekle beraber temel kullanıcı işlemleri, yemek yönetimi, içecek yönetimi, mutfak yönetimi, sipariş yönetimi ve gelir yönetimini kolay bir şekilde yapabilmektedir. Kullanıcı ise hesabını oluşturarak oturduğu restoranı seçerek sipariş verebilir, restoranda beğendiği yemeklerini favori listesine ekleyebilir, vermiş olduğu siparişleri görüntüleyebilir, yapay zeka ve görüntü işleme destekli yemek önerme sistemini kullanabilir ve temel kullanıcı işlemlerini yapabilmektedir.

* [Literatür Taramamız](https://docs.google.com/document/d/1UUTaY4gC3QpCYZKe02AU5oyjrJDOOimWfG05jE5-XXs/edit)
* [Food Consumption Dataset](https://www.efsa.europa.eu/en/data-report/food-consumption-data)
* [UTKFace Dataset](https://www.kaggle.com/datasets/jangedoo/utkface-new)

* Şu anda projede akıllı yemek önerme sistemi aktif bir şekilde çalışmaktadır.

### 📌 Kullanılan Teknolojiler
- Dart / Flutter
- Python
- Firebase

### 📀 Kurulum
* [APK](https://github.com/akaanuzman/digital_order_system/blob/master/digital_order_system.apk)
```bash
git clone https://github.com/akaanuzman/digital_order_system
```

### 📁 Klasör Yapısı ve Yazılım Mimarisi
* Projemizde temiz kod yazılımına ve SOLID prensiplerine dikkat edilmeye çalışılmıştır. Ayrıca nesneye yöneli programlamanın tüm efektif özellikleri kullanılmaya çalışılmıştır. Design Pattern olarak MVMM, Singleton state management olarak Provider kullanılmıştır. Tasarım kısmında ise Atomic Design metodolijisi uygulanmıştır.
* Klasör yapısı olarak core klasörü altında çoğu projelerde kullandığımız compenent'ler, extension'lar, validator'lar gibi yapılar bulunmaktadır. Tüm uygulama içi sabitlerimiz, modellerimiz, viewmodel sınıflarımız, tema yönetimimiz, uygulamaya özel, servisler gibi projenin tüm ana hatları products klaösrü altında bulunmaktadır. Uygulama içi bulunan tüm ekranlarımız ise views klasörü altında yerini almaktadır.

### 🚨 Pull Request ve Issues
* Projemizi deneyimleyip deneyimlerinizi, buglarınızı veya şu özellik de olsa daha güzel olur tarzındaki isteklerinizi issue açabilirsiniz. Yeni bir özellik eklemek isterseniz istediğiniz gibi pr açıp projemize katkıda bulunabilirsiniz.

### 📚 Kaynakça
* [Tek ve en güvenilir kaynakçamız](https://www.youtube.com/@HardwareAndro)

<br>

## 🍽️ Self Service Digital Order System 🇹🇷

### 🗒️ About the Project
* This thesis project was developed by me and my friend [Alperen Akarslan](https://github.com/alperenakarslan) and presented to Düzce University Computer Engineering staff at the end of the 2022-2023 Spring Term. The aim is to provide the wait on the servers and to perform this operation quickly and easily via the mobile application. Based on the personal pictures they upload to their accounts, they use image processing and deep learning cost (CNN) to extract the age, entry group and age range of the person. Its stable descriptions include guidelines from our extensive food use dataset, and favorite dishes that users have chosen, and recommend meals accordingly.

* Two different logins in the application, restaurant and user login. While restaurant owners can add their restaurant account to our application, they can easily perform basic user operations, food management, beverage management, kitchen management, order management and revenue management. The user, on the other hand, can buy the food he likes in the house he occupies, view the orders he has according to his favorite areas, use the artificial intelligence and image processing supported food routing system, and perform basic user operations.

* [Our Literature Search](https://docs.google.com/document/d/1UUTaY4gC3QpCYZKe02AU5oyjrJDOOimWfG05jE5-XXs/edit)
* [Food Consumption Dataset](https://www.efsa.europa.eu/en/data-report/food-conmission-data)
* [UTKFace Dataset](https://www.kaggle.com/datasets/jangedoo/utkface-new)

* Currently, the smart meal guidance system is actively working in the project.

### 📌 Technologies Used
- Darts / Flutter
- Python
- Firebase

### 📀 Installation
* [APK](https://github.com/akaanuzman/digital_order_system/blob/master/digital_order_system.apk)
```bash
git clone https://github.com/akaanuzman/digital_order_system
```

### 📁 Folder Structure and Software Architecture
* In our project, we tried to pay attention to clean code software and SOLID principles. In addition, all the effective features of object-oriented programming have been studied. MVMM was used as the Design Pattern and Provider was used as the Singleton state management. In the field of design, Atomic Design methodology was applied.
* As the folder structure, there are structures such as components, extensions, validators found in most projects under kernel widths. All main lines of our project such as all in-app constants, models, viewmodel classes, theme management, application specific, services are under the products folder. All of our in-app screens are located under the viewports.

### 🚨 Pull Requests and Issues
* You can experience our project and talk about your experiences, mistakes or all aspects of your style, which would be better if it had this feature. You can contribute to our pr project as you want to combine a new feature.

### 📚 Bibliography
* [Our only and most trusted source](https://www.youtube.com/@HardwareAndro)
