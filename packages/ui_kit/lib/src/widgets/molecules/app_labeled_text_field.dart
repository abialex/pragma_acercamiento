import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppLabeledTextField extends StatelessWidget {
  const AppLabeledTextField({
    this.label,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        if (label != null)
          AppText(
            label!,
            variant: AppTextStyle.body2,
          ),
        AppTextField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
          keyboardType: keyboardType,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
