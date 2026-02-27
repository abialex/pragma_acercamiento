import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({required this.label, this.controller, this.hintText, this.onChanged, this.validator, super.key});

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(widget.label, color: colorRoles?.onSurface ?? Colors.orange, variant: AppTextStyle.body2),
        const SizedBox(height: 8.0),
        AppTextField(
          controller: widget.controller,
          hintText: widget.hintText,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          validator: widget.validator,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: colorRoles?.primary ?? Colors.orange,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ],
    );
  }
}
