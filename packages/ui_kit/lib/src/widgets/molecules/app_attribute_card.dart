import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Un card pequeño para mostrar atributos (e.g. Adaptabilidad 5/5)
class AppAttributeCard extends StatelessWidget {
  const AppAttributeCard({required this.label, required this.value, required this.icon, super.key});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>()!;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 32, 12),
      decoration: BoxDecoration(
        color: colorRoles.surface, // purple800
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorRoles.outline, // Borde sutil
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icono con fondo redondeado
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: colorRoles.primary.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(14)),
            child: AppIcon(icon, color: colorRoles.primary, size: 22),
          ),
          const SizedBox(width: 16),
          // Textos
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                label.toUpperCase(),
                variant: AppTextStyle.buttonCaption,
                color: colorRoles.onSurfaceVariant, // Blanco con opacidad
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 4),
              AppText(value, variant: AppTextStyle.h4, color: colorRoles.onSurface, fontWeight: FontWeight.bold),
            ],
          ),
        ],
      ),
    );
  }
}
