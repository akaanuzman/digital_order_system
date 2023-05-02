import '../../../_export_ui.dart';

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const ProfileTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.bodyLarge,
        hintText: hintText,
      ),
    );
  }
}
