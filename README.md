## 🍽️ Self Servis Dijital Sipariş Sistemi 🇹🇷

### 🗒️ Proje Hakkında 
* Bu tez projesi ben ve arkadaşım [Alperen Akarslan](https://github.com/alperenakarslan) ile geliştirilmiş olup 2022-2023 Bahar Dönemi sonunda Düzce Üniversitesi Bilgisayar Mühendisliği akademisyenlerinin beğenisine sunulacaktır. Projenin amacı restoranlarda bulunan garson ihtiyacını kaldırmak ve bu sürecin mobil uygulama üzerinden hızlı ve kolay bir şekilde yapılmasını sağlmaktır. Ayrıca müşterilerin oluşturdukları hesaplarına yükledikleri kişisel resimlerine göre görüntü işleme ve derin öğrneme teknikleri (CNN) kullanılarak karakter analizi ve fiziksel özellik analizi çıkarımı yapmaktadır. Yapılan analizler gerekli sınıflandırma algoritmalarından geçerek kullanıcıya yemek önerisi sunmaktadır.

* Uygulamada restoran ve kullanıcı girişi olmak üzere iki farklı girişi bulunmaktadır. Restoran sahipleri restoran hesabı oluşturarak kendi işletmelerini uygulamamıza ekleyebilmekle beraber temel kullanıcı işlemleri, yemek yönetimi, içecek yönetimi, mutfak yönetimi, sipariş yönetimi ve gelir yönetimini kolay bir şekilde yapabilmektedir. Kullanıcı ise hesabını oluşturarak oturduğu restoranı seçerek sipariş verebilir, restoranda beğendiği yemeklerini favori listesine ekleyebilir, vermiş olduğu siparişleri görüntüleyebilir, yapay zeka ve görüntü işleme destekli yemek önerme sistemini kullanabilir ve temel kullanıcı işlemlerini yapabilmektedir.

* [Literatür Taramamız](https://docs.google.com/document/d/1UUTaY4gC3QpCYZKe02AU5oyjrJDOOimWfG05jE5-XXs/edit)

* Şu anda projenin back-end ile ilgili bağlantıları yapılmış olup tasarım kısmı ve yapay zeka modülleri yazılmaktadır. Gelişmeler gün geçtikçe güncellenecektir.

### 📌 Kullanılan Teknolojiler
- Dart / Flutter
- Python, TensorFlow, Google Colab
- Firebase, Cloud Functions, Javascript

### 📀 Kurulum
* Projeyi klonladıktan sonra pub get yapıp kullanmaya başlayabilirsiniz.

### 📁 Klasör Yapısı ve Yazılım Mimarisi
* Projemizde temiz kod yazılımına ve SOLID prensiplerine dikkat edilmeye çalışılmıştır. Ayrıca nesneye yöneli programlamanın tüm efektif özellikleri kullanılmaya çalışılmıştır. Design Pattern olarak MVMM, Singleton state management olarak Provider kullanılmıştır. Tasarım kısmında ise Atomic Design metodolijisi uygulanmıştır.
* Klasör yapısı olarak core klasörü altında çoğu projelerde kullandığımız compenent'ler, extension'lar, validator'lar gibi yapılar bulunmaktadır. Tüm uygulama içi sabitlerimiz, modellerimiz, viewmodel sınıflarımız, tema yönetimimiz, uygulamaya özel, servisler gibi projenin tüm ana hatları products klaösrü altında bulunmaktadır. Uygulama içi bulunan tüm ekranlarımız ise views klasörü altında yerini almaktadır.

### 🚨 Pull Request ve Issues
* Projemizi deneyimleyip deneyimlerinizi, buglarınızı veya şu özellik de olsa daha güzel olur tarzındaki isteklerinizi issue açabilirsiniz. Yeni bir özellik eklemek isterseniz istediğiniz gibi pr açıp projemize katkıda bulunabilirsiniz.

### 📚 Kaynakça
* [Tek ve en güvenilir kaynakçamız](https://www.youtube.com/@HardwareAndro)

<br>

## 🍽️ Self Service Digital Ordering System 🏴󠁧󠁢󠁥󠁮󠁧󠁿

### 🗒️ About 
* This thesis project has been developed by me and my friend [Alperen Akarslan](https://github.com/alperenakarslan) and will be presented to Düzce University Computer Engineering academicians at the end of the 2022-2023 Spring Term. The aim of the project is to remove the need for waiters in restaurants and to enable this process to be done quickly and easily via the mobile application. In addition, it performs character analysis and physical feature analysis by using image processing and deep learning techniques (CNN) according to the personal pictures that customers upload to their accounts. The analyzes pass through the necessary classification algorithms and offer a meal recommendation to the user.

* There are two different logins in the application: restaurant and user login. Restaurant owners can add their businesses to our application by creating a restaurant account and easily perform basic user operations, food management, beverage management, kitchen management, order management and revenue management. The user, on the other hand, can create his own account and place an order by choosing the restaurant he lives in, add the food he likes in the restaurant to his favorite list, view the orders he has given, and use artificial intelligence and imagery. processing supported food recommendation system and performing basic user operations.

* [Literature Search for Turkish](https://docs.google.com/document/d/1UUTaY4gC3QpCYZKe02AU5oyjrJDOOimWfG05jE5-XXs/edit)

* Currently, the project's backend connections have been made and the design part and artificial intelligence modules are being written. The developments will be updated day by day.

### 📌 Tech Stack
- Dart / Flutter
- Python, TensorFlow, Google Colab
- Firebase, Cloud Functions, Javascript

### 📀 Installation
* After cloning the project, you can get pub get and start using it.

### 📁 Folder Structure and Software Architecture
* We tried to pay attention to clean code software and SOLID principles in our project. In addition, it has been tried to benefit from all the effective features of object-oriented programming. MVMM was used as the Design Model and Provider was used as the Singleton state management. Atomic Design methodology was applied in the design part.
* As the folder structure, there are structures such as component, extension, validator that we use in most projects under the core folder. All the main lines of the project such as all our in-app constants, models, view model classes, theme management, app specific, services are under the products folder. All our in-app screens are located under the skins folder.

### 🚨 Pull Requests and Issues
* You can experience our project and open an issue about your requests, bugs like it would be better if it had this feature. If you want to add a new feature, you can open a pr and contribute to our project.

### 📚 Bibliography
* [Our only and most trusted source](https://www.youtube.com/@HardwareAndro)
