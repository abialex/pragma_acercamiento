import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Una tarjeta destacada diseñada para resaltar una característica o acción principal.
///
/// Soporta dos Estados:
/// 1. **Con gráfico**: Solo título + gráfico (cuando [subtitle] es null)
/// 2. **Con subtítulo y contenido**: Título + subtítulo + contenido adicional (cuando [subtitle] no es null)
///
/// Cuando hay [subtitle], el gráfico no se muestra.
class AppHighlightCard extends StatelessWidget {
  const AppHighlightCard({
    required this.title,
    this.subtitle,
    this.graphic,
    this.content,
    this.gradientType = AppCardGradient.inversePrimary,
    this.onTap,
    super.key,
  });

  /// El título que aparece en la parte superior de la tarjeta.
  final String title;

  /// El subtítulo opcional que aparece debajo del título.
  /// Cuando se proporciona, el gráfico no se muestra.
  final String? subtitle;

  /// El elemento visual (Icono, SvgPicture, Image) que ocupa la mayor parte de la tarjeta.
  /// Se recomienda que este widget sea transparente para lucir el gradiente de fondo.
  /// Solo se muestra cuando [subtitle] es null.
  final Widget? graphic;

  /// Contenido adicional que se muestra cuando hay [subtitle].
  /// Puede ser cualquier widget (texto, botón, columna, etc.).
  final Widget? content;

  /// El estilo del gradiente de fondo.
  final AppCardGradient gradientType;

  /// Acción a realizar al presionar la tarjeta.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        useGradient: true,
        gradientType: gradientType,
        padding: EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Estado 1: Con gráfico (sin subtítulo)
            if (subtitle == null && graphic != null) {
              final size = constraints.maxWidth;
              final graphicSize = size * 0.75;

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    // Título en la parte superior
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title.toUpperCase(),
                            variant: AppTextStyle.h4,
                            color: colorRoles?.white,
                          ),
                        ],
                      ),
                    ),
                    // Elemento gráfico posicionado para que se "derrame" hacia el fondo
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: SizedBox(
                        width: graphicSize,
                        height: graphicSize,
                        child: Opacity(
                          opacity: 0.9,
                          child: graphic!,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            // Estado 2: Con subtítulo y contenido (sin gráfico)
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title.toUpperCase(),
                        variant: AppTextStyle.h4,
                        color: colorRoles?.white,
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        AppText(
                          subtitle!,
                          variant: AppTextStyle.caption,
                          color: colorRoles?.white,
                        ),
                      ],
                    ],
                  ),
                  if (content != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: content!,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
