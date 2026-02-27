import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Estilos para el átomo AppTag
enum AppTagStyle {
  /// Color melocotón (Peach) basado en el rol secundario del tema
  primary,

  /// Color gris claro basado en el rol de superficie variante del tema
  secondary,
}

class AppTag extends StatelessWidget {
  const AppTag({
    required this.label,
    this.style = AppTagStyle.primary,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
    super.key,
  });

  final String label;
  final AppTagStyle style;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) {
      throw Exception('ColorRoles not found in theme');
    }

    final colors = _getColors(colorRoles);

    return Container(
      padding: padding,
      decoration: BoxDecoration(color: colors.backgroundColor, borderRadius: BorderRadius.circular(5.0)),
      child: AppText(
        label,
        variant: AppTextStyle.caption,
        color: colors.textColor,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _TagColors _getColors(ColorRoles colorRoles) {
    switch (style) {
      case AppTagStyle.primary:
        return _TagColors(backgroundColor: colorRoles.surface, textColor: colorRoles.onSurface);
      case AppTagStyle.secondary:
        return _TagColors(backgroundColor: colorRoles.secondaryContainer, textColor: colorRoles.onSurface);
    }
  }
}

class _TagColors {
  final Color backgroundColor;
  final Color textColor;

  _TagColors({required this.backgroundColor, required this.textColor});
}
