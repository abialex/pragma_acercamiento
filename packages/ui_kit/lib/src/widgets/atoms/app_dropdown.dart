import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    required this.options,
    required this.itemBuilder,
    this.value,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.selectedItemBuilder,
    super.key,
  });

  final List<T> options;
  final Widget Function(T) itemBuilder;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final Widget? prefixIcon;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) {
      throw Exception('ColorRoles not found in theme');
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: colorRoles.shadow.withValues(alpha: 0.08), blurRadius: 2, offset: const Offset(0, 1))],
      ),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        items: options.map((option) => DropdownMenuItem<T>(value: option, child: itemBuilder(option))).toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: const SizedBox.shrink(), // Ocultamos el icono de la derecha
        isExpanded: true,
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          hintText: hintText,
          prefixIcon: prefixIcon ?? AppIcon(Icons.keyboard_arrow_down, color: colorRoles.primary),
          prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        ),
        style: AppText.getStyle(AppTextStyle.textFill).copyWith(color: colorRoles.scrim),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
