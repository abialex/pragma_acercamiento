import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppLinkButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final AppTextStyle textVariant;
  final EdgeInsetsGeometry? padding;
  final double opacity;

  const AppLinkButton({
    required this.label,
    required this.onPressed,
    this.color,
    this.textVariant = AppTextStyle.buttonLink,
    this.padding,
    this.opacity = 1.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    final baseColor = color ?? colorRoles?.onSecondary ?? Colors.blue;
    final effectiveColor = baseColor.withValues(alpha: opacity);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: AppText(
          label,
          variant: textVariant,
          color: effectiveColor,
          decoration: TextDecoration.underline,
          decorationColor: effectiveColor,
        ),
      ),
    );
  }
}
