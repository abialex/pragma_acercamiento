import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ui_kit/ui_kit.dart';

@UseCase(name: 'Default', type: AppAttributeCard)
Widget appAttributeCardUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppAttributeCard(
        label: context.knobs.string(label: 'Label', initialValue: 'Adaptabilidad'),
        value: context.knobs.string(label: 'Value', initialValue: '5/5'),
        icon: Icons.favorite_border,
      ),
    ),
  );
}

@UseCase(name: 'Search Bar', type: AppLabeledTextField)
Widget appLabeledTextFieldUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppLabeledTextField(
        label: context.knobs.stringOrNull(label: 'Label', initialValue: null),
        hintText: context.knobs.string(label: 'Hint Text', initialValue: 'Buscar raza en inglés...'),
        prefixIcon: AppIcon(
          Icons.search,
          color: Theme.of(context).extension<ColorRoles>()?.primary ?? Colors.purple,
          size: 20,
        ),
        obscureText: context.knobs.boolean(label: 'Obscure Text', initialValue: false),
        onChanged: (_) {},
      ),
    ),
  );
}
