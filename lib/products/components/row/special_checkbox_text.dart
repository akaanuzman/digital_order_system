import '../../view_models/login_view_model.dart';
import '../../../_export_ui.dart';

class SpecialRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  const SpecialRow({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: context.mainAxisASpaceBetween,
      children: [
        Row(
          children: [
            Consumer<LoginViewModel>(
              builder: (context, pv, _) {
                return Checkbox(
                  value: pv.isRememberMe,
                  onChanged: (value) => pv.onChangedRememberMe,
                );
              },
            ),
            Text(
              leftText,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        Text(
          rightText,
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
