import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ui_kit/ui_kit.dart';

@UseCase(name: 'Default', type: AsambleaCard)
Widget asambleaCardUseCase(BuildContext context) {
  return Center(
    child: AsambleaCard(
      asambleaNumber: context.knobs.string(label: 'Asamblea #', initialValue: '123'),
      startTime: context.knobs.string(label: 'Inicio en', initialValue: '10:00 AM'),
      date: context.knobs.string(label: 'Fecha', initialValue: '25 Oct 2026'),
      isNotificationActive: context.knobs.boolean(label: 'Notificación Activa', initialValue: true),
      onLivePressed: () {},
      onCalendarPressed: () {},
    ),
  );
}

@UseCase(name: 'Default', type: AppCatCard)
Widget appCatCardUseCase(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppCatCard(
        breedName: context.knobs.string(label: 'Breed Name', initialValue: 'Persian'),
        imageUrl: context.knobs.string(label: 'Image URL', initialValue: AppAssets.defaultPlaceholder),
        origin: context.knobs.string(label: 'Origin', initialValue: 'Iran'),
        intelligence: context.knobs.int.slider(label: 'Intelligence', initialValue: 4, min: 1, max: 5),
        isFavorite: context.knobs.boolean(label: 'Is Favorite', initialValue: false),
        onFavoriteTap: () {},
        onTap: () {},
      ),
    ),
  );
}
