import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({super.key, required this.cat});

  final CatBreed cat;

  @override
  Widget build(BuildContext context) {
    return CatbreedsDetailPage<CatBreed>(
      item: cat,
      backgroundType: AppBackgroundType.darkSolid,
      nameExtractor: (c) => c.name,
      imageUrlExtractor: (c) => c.imageUrl ?? 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
      originExtractor: (c) => c.origin ?? 'Desconocido',
      intelligenceExtractor: (c) => c.intelligence ?? 0,
      isFavoriteExtractor: (c) => c.isFavorite,
      descriptionExtractor: (c) => 'Esta es una descripción de prueba para la raza ${c.name}. Son gatos muy interesantes y divertidos.',
      adaptabilityExtractor: (c) => 5, // Fake data for now
      lifeSpanExtractor: (c) => '12 - 15', // Fake data for now
      temperamentExtractor: (c) => c.temperament ?? '',
      onBack: () => context.pop(),
      onToggleFavorite: (isActive) {
        debugPrint('Toggle favorite on detail: $isActive');
      },
    );
  }
}
