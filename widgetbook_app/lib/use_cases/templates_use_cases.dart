import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/presentation/splash_screen.dart';

@UseCase(name: 'Default', type: AppBasePage)
Widget appBasePageUseCase(BuildContext context) {
  return AppBasePage(
    type: context.knobs.object.dropdown(
      label: 'Background Type',
      options: AppBackgroundType.values,
      initialOption: AppBackgroundType.type1,
    ),
    body: Center(
      child: AppText(
        context.knobs.string(label: 'Body Text', initialValue: 'Página Base Pragma'),
        variant: AppTextStyle.h2,
        color: Colors.white,
      ),
    ),
  );
}

@UseCase(name: 'Default', type: SplashPage)
Widget splashPageUseCase(BuildContext context) {
  return const SplashPage();
}

@UseCase(name: 'Catbreeds List', type: CatbreedsListPage)
Widget catbreedsListPageUseCase(BuildContext context) {
  // Use Widgetbook knobs to allow adjusting properties dynamically
  final backgroundType = context.knobs.object.dropdown(
    label: 'Background Type',
    options: AppBackgroundType.values,
    initialOption: AppBackgroundType.darkSolid,
  );

  final isFavoriteActive = context.knobs.boolean(
    label: 'Is Favorite Active',
    initialValue: false,
  );

  // Dummy data utilizing the domain model
  final dummyCats = const [
    CatBreed(
      breedId: 'abys',
      name: 'Abyssinian',
      imageUrl: '',
      origin: 'Egypt',
      intelligence: 5,
      isFavorite: false,
    ),
    CatBreed(
      breedId: 'aege',
      name: 'Aegean',
      imageUrl: '',
      origin: 'Greece',
      intelligence: 4,
      isFavorite: false,
    ),
    CatBreed(
      breedId: 'amau',
      name: 'American Bobtail',
      imageUrl: '',
      origin: 'United States',
      intelligence: 5,
      isFavorite: true,
    ),
  ];

  return CatbreedsListPage<CatBreed>(
    backgroundType: backgroundType,
    initialFavoriteActive: isFavoriteActive,
    items: dummyCats,
    nameExtractor: (cat) => cat.name,
    imageUrlExtractor: (cat) => cat.imageUrl ?? '',
    originExtractor: (cat) => cat.origin ?? 'Unknown',
    intelligenceExtractor: (cat) => cat.intelligence ?? 0,
    isFavoriteExtractor: (cat) => cat.isFavorite,
    onCatFavoriteTap: (cat) {},
    onCatTap: (cat) {},
    onToggleFavorite: (val) {},
    onSearchChanged: (val) {},
  );
}

@UseCase(name: 'Catbreed Details', type: CatbreedsDetailPage)
Widget catbreedsDetailPageUseCase(BuildContext context) {
  final backgroundType = context.knobs.object.dropdown(
    label: 'Background Type',
    options: AppBackgroundType.values,
    initialOption: AppBackgroundType.darkSolid,
  );

  final dummyCat = const CatBreed(
    breedId: 'abys',
    name: 'Abyssinian',
    imageUrl: '',
    origin: 'Egypt',
    intelligence: 5,
    temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
    isFavorite: false,
  );

  return CatbreedsDetailPage<CatBreed>(
    item: dummyCat,
    nameExtractor: (cat) => cat.name,
    imageUrlExtractor: (cat) => cat.imageUrl ?? '',
    originExtractor: (cat) => cat.origin ?? 'Unknown',
    intelligenceExtractor: (cat) => cat.intelligence ?? 0,
    isFavoriteExtractor: (cat) => cat.isFavorite,
    descriptionExtractor: (cat) =>
        'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
    adaptabilityExtractor: (cat) => 5,
    lifeSpanExtractor: (cat) => '14 - 15 años',
    temperamentExtractor: (cat) => cat.temperament ?? '',
    backgroundType: backgroundType,
    onBack: () {},
    onToggleFavorite: (val) {},
  );
}
