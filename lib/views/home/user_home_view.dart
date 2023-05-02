import '../../../_export_ui.dart';
import '../../products/constants/image_constants.dart';

class UserHomeView extends StatelessWidget with BaseSingleton {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("sadasd"),
        actions: [
          appBarActionsIcon(context),
        ],
      ),
      body: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //scroll directions varmış ona bakarak vereceksin.
          maxCrossAxisExtent: context.val15x * 2,
          mainAxisExtent: context.val15x * 4,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return gridViewContainer(context, ImageConstants.mainDishes.toPng);
        },
      ),
    );
  }

  Widget gridViewContainer(BuildContext context, String imageLabel) {
    return Image.asset(
      imageLabel,
      width: context.val15x * 3,
      height: context.val15x * 3,
    );
  }

  Padding appBarActionsIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.val4x),
      child: Icon(
        Icons.notifications_outlined,
        size: context.val8x,
      ),
    );
  }
}
