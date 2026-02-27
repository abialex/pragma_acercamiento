import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  // Fake data para probar el template
  final List<CatBreed> _fakeCats = const [
    CatBreed(
      breedId: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      intelligence: 5,
      imageUrl: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
      temperament: 'Active, Energetic, Independent',
    ),
    CatBreed(
      breedId: 'beng',
      name: 'Bengal',
      origin: 'United States',
      intelligence: 5,
      imageUrl: 'https://cdn2.thecatapi.com/images/O3btzLlsO.png',
      temperament: 'Alert, Agile, Energetic',
      isFavorite: true,
    ),
    CatBreed(
      breedId: 'pers',
      name: 'Persian',
      origin: 'Iran (Persia)',
      intelligence: 3,
      imageUrl: 'https://cdn2.thecatapi.com/images/-Zfz5z2jK.jpg',
      temperament: 'Affectionate, loyal, Sedate, Quiet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CatbreedsListPage<CatBreed>(
      items: _fakeCats,
      backgroundType: AppBackgroundType.darkSolid,
      nameExtractor: (cat) => cat.name,
      imageUrlExtractor: (cat) => cat.imageUrl ?? '',
      originExtractor: (cat) => cat.origin ?? 'Desconocido',
      intelligenceExtractor: (cat) => cat.intelligence ?? 0,
      isFavoriteExtractor: (cat) => cat.isFavorite,
      onToggleFavorite: (isActive) {
        debugPrint('Toggle favorite header: $isActive');
      },
      onSearchChanged: (query) {
        debugPrint('Buscando: $query');
      },
      onCatFavoriteTap: (cat) {
        debugPrint('Toggle favorito id: ${cat.breedId}');
        // Implementar actualización del estado real
      },
      onCatTap: (cat) {
        // Navigate to details
        context.pushNamed(CatRoutes.detailcat.name, extra: cat);
      },
    );
  }
}
