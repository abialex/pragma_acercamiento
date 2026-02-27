import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Un botón toggle (molecule) que cambia su estado visual para "Ver Todos" o "Favoritos".
class AppToggleFavoriteButton extends StatelessWidget {
  const AppToggleFavoriteButton({required this.isFavoriteActive, required this.onPressed, super.key});

  /// Si es activo muestra "Ver Todos" lleno, si es inactivo muestra "Favoritos" en outline
  final bool isFavoriteActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (isFavoriteActive) {
      // Estado Filled: "Ver Todos"
      return AppButton(
        label: 'Ver Todos',
        onPressed: onPressed,
        style: AppButtonStyle.primary, // usa primary (violet500 en dark theme)
        shape: AppButtonShape.pill,
        size: AppButtonSize.small,
        prefixIcon: (color, isEnabled) => AppIcon(Icons.favorite, color: color, size: 16),
      );
    } else {
      // Estado Outlined: "Favoritos"
      final colorRoles = Theme.of(context).extension<ColorRoles>()!;

      return SizedBox(
        height: AppButtonSize.small.height,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: colorRoles.onSurface, // blanco o texto
            side: BorderSide(color: colorRoles.outlineVariant), // Borde sutil
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          icon: AppIcon(Icons.favorite_border, color: colorRoles.onSurfaceVariant, size: 16),
          label: AppText('Favoritos', variant: AppTextStyle.buttonCaption, color: colorRoles.onSurface),
        ),
      );
    }
  }
}
