import 'package:convo_/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.title,
    this.suffixIcon,
    this.hint,
    required this.controller,
    this.isObsecureText,
    this.suffixIconOnTap,
    required this.validator,
    this.initialValue,
  });

  final String? title;
  final IconData? suffixIcon;
  final String? hint;
  final TextEditingController controller;
  final bool? isObsecureText;
  final VoidCallback? suffixIconOnTap;
  final String? initialValue;

  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObsecureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.font12GrayRegular,
        labelStyle: AppTextStyles.font13GrayRegular,
        label: Text(title ?? ''),
        suffixIcon: IconButton(
          onPressed: suffixIconOnTap,
          icon: Icon(suffixIcon),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
