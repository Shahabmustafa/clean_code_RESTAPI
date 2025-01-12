import 'package:flutter_setup/view.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.hintText,
    this.onlyNumber = false,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    super.key});

  final bool onlyNumber,obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffixIcon,prefixIcon;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorHeight: 14,
      style: Theme.of(context).textTheme.titleMedium,
      inputFormatters: onlyNumber ? <TextInputFormatter>[
         FilteringTextInputFormatter.digitsOnly,
      ] : null,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      onTap: onTap,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
