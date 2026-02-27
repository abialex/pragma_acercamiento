import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Una tarjeta de acción rápida que incluye un título, un campo de entrada y un botón.
///
/// Diseñada sobre un fondo color melocotón sólido para destacar acciones de consulta o registro.
class AppPromptCard extends StatelessWidget {
  const AppPromptCard({
    required this.title,
    required this.buttonLabel,
    required this.content,
    this.onButtonPressed,
    super.key,
  });

  /// El título que describe la acción.
  final String title;

  /// El texto dentro del botón de acción.
  final String buttonLabel;

  /// El contenido central de la tarjeta (la "entrada").
  final Widget content;

  /// Acción a ejecutar al presionar el botón.
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) return const SizedBox.shrink();

    return AppCard(
      useGradient: false,
      // backgroundColor: colorRoles.secondary,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          content,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText(
                  title,
                  variant: AppTextStyle.body1,
                  color: colorRoles.primary,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                AppButton(
                  label: buttonLabel,
                  onPressed: onButtonPressed,
                  style: AppButtonStyle.primary,
                  shape: AppButtonShape.pill,
                  size: AppButtonSize.small,
                  isFullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
