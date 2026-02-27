import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Una tarjeta informativa que reutiliza [AppCard] con el estilo visual
/// definido en los recursos del sistema (color melocotón con overlay blanco).
class AppCardInfo extends StatelessWidget {
  /// El texto a mostrar en la tarjeta.
  final String text;

  /// Icono opcional a mostrar al inicio de la tarjeta.
  final IconData? icon;

  /// El padding interno de la tarjeta.
  final EdgeInsetsGeometry padding;

  /// El estilo del texto.
  final AppTextStyle textVariant;

  /// El color del texto (opcional).
  final Color? textColor;

  const AppCardInfo({
    required this.text,
    this.icon,
    this.padding = const EdgeInsets.all(16.0),
    this.textVariant = AppTextStyle.body2,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    final baseColor = colorRoles?.secondary;

    return AppCard(
      backgroundColor: baseColor,
      padding: EdgeInsets.zero, // Quitamos el padding del Card para que el overlay cubra todo
      child: Container(
        // Capa 2: Overlay blanco al 40% (0.4 * 255 = 102 -> 0x66)
        color: Colors.white.withValues(alpha: 0.4),
        padding: padding, // Aplicamos el padding aquí para el contenido
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[AppIcon(icon!, size: 20, color: colorRoles?.onSurface), const SizedBox(width: 12)],
            Expanded(
              child: AppText(text, variant: textVariant, color: textColor ?? colorRoles?.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
