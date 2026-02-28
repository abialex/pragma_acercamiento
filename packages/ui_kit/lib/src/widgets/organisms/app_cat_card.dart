import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Componente principal para visualizar la tarjeta de un gato en el listado.
class AppCatCard extends StatelessWidget {
  const AppCatCard({
    required this.breedName,
    required this.imageUrl,
    required this.origin,
    required this.intelligence,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
    super.key,
  });

  final String breedName;
  final String imageUrl;
  final String origin;
  final int intelligence;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colorRoles.surface, // purple800
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colorRoles.outlineVariant, // Borde muy tenue
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header: Nombre + iconos de acción
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(breedName, variant: AppTextStyle.h4, color: colorRoles.onSurface, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: onFavoriteTap,
                    icon: AppIcon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? colorRoles.primary : colorRoles.onSurfaceVariant,
                      size: 24,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: onTap,
                    child: AppText('Más...', variant: AppTextStyle.body2, color: colorRoles.primary, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            // Imagen central
            imageUrl.isNotEmpty
                ? AppImage.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.fitWidth)
                : const AppImage.asset(AppAssets.defaultPlaceholder, height: 250, width: double.infinity),

            // Footer: País e Inteligencia
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Origen
                  Row(
                    children: [
                      const AppIcon(
                        Icons.language, // Globo para simular país
                        // color: colorRoles.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      AppText(origin, variant: AppTextStyle.body2, color: colorRoles.onSurface),
                    ],
                  ),
                  // Inteligencia
                  Row(
                    children: [
                      const AppIcon(
                        Icons.psychology, // Cerebro para simular inteligencia
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      AppText('Inteligencia: $intelligence', variant: AppTextStyle.body2, color: colorRoles.onSurface),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
