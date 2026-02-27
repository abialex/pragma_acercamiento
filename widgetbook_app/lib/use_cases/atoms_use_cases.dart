import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ui_kit/ui_kit.dart';

@UseCase(name: 'Default', type: AppButton)
Widget appButtonUseCase(BuildContext context) {
  return Center(
    child: AppButton(
      label: context.knobs.string(label: 'Label', initialValue: 'Click me'),
      onPressed: context.knobs.boolean(label: 'Enabled', initialValue: true) ? () {} : null,
      isLoading: context.knobs.boolean(label: 'Is Loading', initialValue: false),
    ),
  );
}

@UseCase(name: 'All Variants', type: AppText)
Widget appTextUseCase(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          context.knobs.string(label: 'Text', initialValue: 'Headline Large'),
          variant: AppTextStyle.h1,
        ),
        const SizedBox(height: 16),
        AppText(
          'Headline Medium',
          variant: AppTextStyle.h2,
          color: context.colorRoles.primary,
        ),
        const SizedBox(height: 16),
        const AppText(
          'Body Large',
          variant: AppTextStyle.body1,
        ),
        const SizedBox(height: 16),
        const AppText(
          'Caption',
          variant: AppTextStyle.caption,
        ),
      ],
    ),
  );
}

@UseCase(name: 'Network Image', type: AppImage)
Widget appImageUseCase(BuildContext context) {
  return Center(
    child: AppImage.network(
      context.knobs.string(
        label: 'URL',
        initialValue: 'https://via.placeholder.com/150',
      ),
      width: context.knobs.double.slider(
        label: 'Width',
        initialValue: 150,
        min: 50,
        max: 300,
      ),
      height: context.knobs.double.slider(
        label: 'Height',
        initialValue: 150,
        min: 50,
        max: 300,
      ),
    ),
  );
}

@UseCase(name: 'Default', type: AppTag)
Widget appTagUseCase(BuildContext context) {
  return Center(
    child: AppTag(
      label: context.knobs.string(label: 'Label', initialValue: 'New'),
      style: context.knobs.object.dropdown<AppTagStyle>(
        label: 'Style',
        options: AppTagStyle.values,
        initialOption: AppTagStyle.primary,
      ),
    ),
  );
}
