import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_acercamiento/core/error/failures.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_cubit.dart';

class CatDetailScreen extends StatefulWidget {
  const CatDetailScreen({super.key, required this.cat});

  final CatBreed cat;

  @override
  State<CatDetailScreen> createState() => _CatDetailScreenState();
}

class _CatDetailScreenState extends State<CatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CatbreedsDetailPage<CatBreed>(
      item: widget.cat,
      backgroundType: AppBackgroundType.darkSolid,
      nameExtractor: (c) => c.name,
      imageUrlExtractor: (c) => c.imageUrl ?? '',
      originExtractor: (c) => c.origin ?? 'Desconocido',
      intelligenceExtractor: (c) => c.intelligence ?? 0,
      isFavoriteExtractor: (c) => c.isFavorite,
      descriptionExtractor: (c) => c.description ?? 'No hay descripción disponible para esta raza.',
      adaptabilityExtractor: (c) => c.adaptability ?? 0,
      affectionLevelExtractor: (c) => c.affectionLevel ?? 0,
      childFriendlyExtractor: (c) => c.childFriendly ?? 0,
      dogFriendlyExtractor: (c) => c.dogFriendly ?? 0,
      energyLevelExtractor: (c) => c.energyLevel ?? 0,
      groomingExtractor: (c) => c.grooming ?? 0,
      lifeSpanExtractor: (c) => c.lifeSpan ?? 'Desconocido',
      temperamentExtractor: (c) => c.temperament ?? '',
      onBack: () => context.pop(),
      onToggleFavorite: (isActive) {
        _toggleFavorite(widget.cat);
      },
    );
  }

  void _toggleFavorite(CatBreed cat) async {
    final result = await context.read<CatListCubit>().toggleFavorite(cat.breedId);
    result.mapLeft((failure) {
      if (failure is FailureLocal) {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: "Error local", body: AppText(failure.error)),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: "Error api", body: AppText(failure.error)),
        );
      }
    });
  }
}
