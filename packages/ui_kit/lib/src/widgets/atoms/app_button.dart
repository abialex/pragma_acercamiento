// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Callback para construir iconos dinámicos según el estado del botón
typedef AppButtonIconBuilder = Widget Function(Color color, bool isEnabled);

/// Enum para los estilos del botón
enum AppButtonStyle {
  /// Orange primary (PMS 1655 C)
  primary,

  /// Peach secondary (PMS 712 C)
  secondary,

  /// Peach secondary altern colorText Primary
  secondaryAlt,

  /// Light orange tertiary (PMS 165 C)
  tertiary,

  /// Red alert for danger actions (PMS 3516 C)
  alert,
}

/// Enum para los tamaños del botón
enum AppButtonSize {
  /// Altura de 52px
  normal(height: 52.0),

  /// Altura de 34px
  small(height: 34.0);

  final double height;
  const AppButtonSize({required this.height});
}

/// Enum para las formas del botón
enum AppButtonShape {
  /// Border radius de 10px
  rounded(radius: 10.0),

  /// Border radius de 50px (píldora)
  pill(radius: 50.0);

  final double radius;
  const AppButtonShape({required this.radius});
}

/// Widget AppButton heredando de ElevatedButton
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.size = AppButtonSize.normal,
    this.shape = AppButtonShape.rounded,
    this.textVariant = AppTextStyle.buttonMain,
    this.fontWeight,
    this.fontStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isFullWidth = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonStyle style;
  final AppButtonSize size;
  final AppButtonShape shape;
  final AppTextStyle textVariant;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final AppButtonIconBuilder? prefixIcon;
  final AppButtonIconBuilder? suffixIcon;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) {
      throw Exception('ColorRoles not found in theme');
    }

    final colors = _getColors(colorRoles);
    final customTextVariant = _getSize(size);
    final isEnabled = onPressed != null && !isLoading;

    return SizedBox(
      height: size.height,
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.backgroundColor,
          foregroundColor: colors.textColor,
          disabledBackgroundColor: colorRoles.outlineVariant.withValues(alpha: 0.5),
          disabledForegroundColor: colorRoles.outline,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shape.radius),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: _AppButtonContent(
          label: label,
          prefixIconBuilder: prefixIcon,
          suffixIconBuilder: suffixIcon,
          isLoading: isLoading,
          textColor: colors.textColor,
          isEnabled: isEnabled,
          disabledTextColor: colorRoles.outline,
          textVariant: customTextVariant ?? textVariant,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }

  _ButtonColors _getColors(ColorRoles colorRoles) {
    switch (style) {
      case AppButtonStyle.primary:
        return _ButtonColors(
          backgroundColor: colorRoles.primary,
          textColor: colorRoles.onPrimary,
        );
      case AppButtonStyle.secondary:
        return _ButtonColors(
          backgroundColor: colorRoles.secondary,
          textColor: colorRoles.onSecondary,
        );
      case AppButtonStyle.tertiary:
        return _ButtonColors(
          backgroundColor: colorRoles.tertiary,
          textColor: colorRoles.onTertiary,
        );
      case AppButtonStyle.alert:
        return _ButtonColors(
          backgroundColor: colorRoles.jornadaDanger,
          textColor: colorRoles.onJornadaDanger,
        );
      case AppButtonStyle.secondaryAlt:
        return _ButtonColors(
          backgroundColor: colorRoles.secondary,
          textColor: colorRoles.primary,
        );
    }
  }

  AppTextStyle? _getSize(AppButtonSize buttonSize) {
    return buttonSize == AppButtonSize.small ? AppTextStyle.buttonCaption : AppTextStyle.body1;
  }
}

/// Widget interno para construir el contenido del botón
class _AppButtonContent extends StatelessWidget {
  const _AppButtonContent({
    required this.label,
    required this.prefixIconBuilder,
    required this.suffixIconBuilder,
    required this.isLoading,
    required this.textColor,
    required this.isEnabled,
    required this.disabledTextColor,
    required this.textVariant,
    this.fontWeight,
    this.fontStyle,
  });

  final String label;
  final AppButtonIconBuilder? prefixIconBuilder;
  final AppButtonIconBuilder? suffixIconBuilder;
  final bool isLoading;
  final Color textColor;
  final bool isEnabled;
  final Color disabledTextColor;
  final AppTextStyle textVariant;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(isEnabled ? textColor : disabledTextColor),
        ),
      );
    }

    final effectiveColor = isEnabled ? textColor : disabledTextColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: _buildContent(effectiveColor),
    );
  }

  Widget _buildContent(Color color) {
    final prefix = prefixIconBuilder?.call(color, isEnabled);
    final suffix = suffixIconBuilder?.call(color, isEnabled);

    if (prefix == null && suffix == null) {
      return AppText(
        label,
        variant: textVariant,
        color: color,
        textAlign: TextAlign.center,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        if (prefix != null)
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: prefix,
          ),
        Flexible(
          child: AppText(
            label,
            variant: textVariant,
            color: color,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
          ),
        ),
        if (suffix != null)
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: suffix,
          ),
      ],
    );
  }
}

/// Clase interna para agrupar los colores
class _ButtonColors {
  final Color backgroundColor;
  final Color textColor;

  _ButtonColors({
    required this.backgroundColor,
    required this.textColor,
  });
}
