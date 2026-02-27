import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Molécula de tarjeta para acciones promocionales o de comunidad.
///
/// Presenta una ilustración a la izquierda y un bloque de texto con botón a la derecha.
class AppActionCard extends StatelessWidget {
  const AppActionCard({
    required this.text,
    required this.buttonLabel,
    required this.graphic,
    this.onButtonPressed,
    this.gradientType = AppCardGradient.inverseSecondary,
    super.key,
  });

  /// El texto o mensaje principal de la tarjeta.
  final String text;

  /// El texto que aparecerá dentro del botón.
  final String buttonLabel;

  /// El elemento visual (Ilustración, Icono, Svg) que aparece a la izquierda.
  final Widget graphic;

  /// Acción que se ejecuta al presionar el botón.
  final VoidCallback? onButtonPressed;

  /// El tipo de gradiente de fondo.
  final AppCardGradient gradientType;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return AppCard(
      useGradient: true,
      gradientType: gradientType,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          // Graphic Element (Left)
          SizedBox(
            width: 75,
            child: graphic,
          ),
          // Content Element (Right)
          Expanded(
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text,
                  variant: AppTextStyle.body2,
                  color: colorRoles?.white ?? Colors.white,
                ),
                AppButton(
                  label: buttonLabel,
                  onPressed: onButtonPressed,
                  style: AppButtonStyle.tertiary,
                  shape: AppButtonShape.pill,
                  size: AppButtonSize.small,
                  textVariant: AppTextStyle.caption,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
