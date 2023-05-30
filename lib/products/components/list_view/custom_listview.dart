import '../../../_export_ui.dart';
import '../../view_models/my_basket_view_model.dart';

class CustomListView extends StatelessWidget with BaseSingleton {
  final String title;
  final String price;
  final String time;
  final MyBasketViewModel hpv;
  CustomListView({
    super.key,
    required this.title,
    required this.price,
    required this.time,
    required this.hpv,
  });

  @override
  Widget build(BuildContext context) {
    final hpv = Provider.of<MyBasketViewModel>(context, listen: false);
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.val3x,
          bottom: context.val3x,
        ),
        child: ListTile(
          leading: Image.asset("assets/images/hamburger.png"),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            price,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: SizedBox(
            width: context.val19x,
            child: Column(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                context.emptySizedHeightBox1x,
                Row(
                  children: [
                    circleAvatarIcon(
                      context,
                      Icons.remove,
                      colors.redSavinaPepper,
                      Colors.red.shade100,
                      () {
                        hpv.decreaseCounter;
                      },
                    ),
                    context.emptySizedWidthBox2x,
                    Consumer<MyBasketViewModel>(
                      builder: (context, hpv, _) => Text(
                        "${hpv.counter}",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    context.emptySizedWidthBox2x,
                    circleAvatarIcon(
                      context,
                      Icons.add,
                      Colors.white,
                      colors.redSavinaPepper,
                      () {
                        hpv.increaseCounter;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar circleAvatarIcon(
    BuildContext context,
    IconData icon,
    Color color,
    Color circleColor,
    void Function()? onPressed,
  ) {
    return CircleAvatar(
      backgroundColor: circleColor,
      radius: context.val3x,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed ?? () {},
        icon: Icon(
          icon,
          size: context.val5x,
          color: color,
        ),
      ),
    );
  }
}
