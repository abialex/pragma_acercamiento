import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppLabeledDropdown<T> extends StatelessWidget {
  const AppLabeledDropdown({
    this.label,
    required this.options,
    required this.itemText,
    this.value,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    super.key,
  });

  final String? label;
  final List<T> options;
  final String Function(T) itemText;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

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
        AppDropdown<T>(
          options: options,
          itemBuilder: (option) => AppText(
            itemText(option),
            color: colorRoles?.primary,
            variant: AppTextStyle.textFill,
          ),
          value: value,
          onChanged: onChanged,
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
