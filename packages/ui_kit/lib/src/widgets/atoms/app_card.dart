import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Tipos de gradiente disponibles para el AppCard
enum AppCardGradient {
  /// Gradiente naranja primario
  primary,

  /// Gradiente inverso primario
  inversePrimary,

  /// Gradiente naranja (Bottom-Left a Top-Right)
  secondary,

  /// Gradiente melocotón
  inverseSecondary,

  ///
  terciary,
}

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = 10,
    this.useGradient = false,
    this.gradientType = AppCardGradient.primary,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool useGradient;
  final AppCardGradient gradientType;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) {
      throw Exception('ColorRoles not found in theme');
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      decoration: BoxDecoration(
        color: backgroundColor ?? (useGradient ? null : colorRoles.surface),
        gradient: useGradient ? _getGradient(colorRoles) : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }

  Gradient _getGradient(ColorRoles colorRoles) {
    switch (gradientType) {
      case AppCardGradient.primary:
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            colorRoles.gradientPrimary,
            colorRoles.gradientTerciary,
          ],
          stops: const [0.0, 1.0],
        );
      case AppCardGradient.inversePrimary:
        return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            colorRoles.gradientPrimary,
            colorRoles.gradientTerciary,
          ],
          stops: const [0.0, 1.0],
        );
      case AppCardGradient.secondary:
        return LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            colorRoles.gradientSecondary,
            colorRoles.gradientPrimary,
          ],
          stops: const [0.0, 1.0],
        );
      case AppCardGradient.inverseSecondary:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorRoles.gradientSecondary,
            colorRoles.gradientPrimary,
          ],
          stops: const [0.0, 1.0],
        );

      case AppCardGradient.terciary:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorRoles.white,
            colorRoles.surfaceContainer,
          ],
          stops: const [0.0, 1.0],
        );
    }
  }
}
