import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

enum AppTextStyle {
  // Headers (Basic Sans)
  h1,
  h2,
  h3,
  h4,
  // Numbers (Basic Sans Italic)
  numberL,
  numberM,
  numberS,
  // Body (Neue Haas Unica)
  subtitle1,
  body1,
  body2,
  caption,
  // Buttons & UI (Neue Haas Unica)
  buttonMain,
  buttonLink,
  buttonCaption,
  textFill,
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double opacity;
  final Color? decorationColor;

  const AppText(
    this.text, {
    super.key,
    this.variant = AppTextStyle.body1,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.opacity = 1.0,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    final defaultColor = colorRoles?.onSurface ?? Colors.black;
    final effectiveColor = (color ?? defaultColor).withValues(alpha: opacity);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: getStyle(variant).copyWith(
        color: effectiveColor,
        decoration: decoration,
        decorationColor: decorationColor ?? effectiveColor,
        height: height,
        letterSpacing: letterSpacing ?? 0.5,
        wordSpacing: wordSpacing ?? _getDefaultWordSpacing(variant),
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
      ),
    );
  }

  static double _getDefaultWordSpacing(AppTextStyle variant) {
    switch (variant) {
      // --- HEADERS ---
      case AppTextStyle.h1:
      case AppTextStyle.h2:
        return -2.5;
      case AppTextStyle.h3:
      case AppTextStyle.h4:
        return -2;

      // --- NUMBERS ---
      case AppTextStyle.numberL:
      case AppTextStyle.numberM:
      case AppTextStyle.numberS:
        return 0.5;

      // --- BODY ---
      case AppTextStyle.subtitle1:
      case AppTextStyle.body1:
      case AppTextStyle.body2:
        return 0.5;
      case AppTextStyle.caption:
        return 0.5;

      // --- BUTTONS / UI ---
      case AppTextStyle.buttonMain:
      case AppTextStyle.buttonLink:
      case AppTextStyle.textFill:
        return 0.5;
      case AppTextStyle.buttonCaption:
        return 0.5;
    }
  }

  static TextStyle getStyle(AppTextStyle variant) {
    // Definición de Familias
    const String fontUnica = 'packages/ui_kit/NeueHaasUnica';

    switch (variant) {
      // --- HEADERS (Neue Haas Unica - Bold 700) ---
      case AppTextStyle.h1:
        return const TextStyle(fontFamily: fontUnica, fontSize: 62, fontWeight: FontWeight.w700);
      case AppTextStyle.h2:
        return const TextStyle(fontFamily: fontUnica, fontSize: 42, fontWeight: FontWeight.w700);
      case AppTextStyle.h3:
        return const TextStyle(fontFamily: fontUnica, fontSize: 28, fontWeight: FontWeight.w700);
      case AppTextStyle.h4:
        return const TextStyle(fontFamily: fontUnica, fontSize: 16, fontWeight: FontWeight.w700);

      // --- NUMBERS (Neue Haas Unica - Bold Italic 700) ---
      case AppTextStyle.numberL:
        return const TextStyle(fontFamily: fontUnica, fontSize: 62, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);
      case AppTextStyle.numberM:
        return const TextStyle(fontFamily: fontUnica, fontSize: 42, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);
      case AppTextStyle.numberS:
        return const TextStyle(fontFamily: fontUnica, fontSize: 28, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);

      // --- BODY (Neue Haas Unica - Medium 500 / Regular 400) ---
      case AppTextStyle.subtitle1:
        return const TextStyle(fontFamily: fontUnica, fontSize: 24, fontWeight: FontWeight.w500);
      case AppTextStyle.body1:
        return const TextStyle(fontFamily: fontUnica, fontSize: 16, fontWeight: FontWeight.w500);
      case AppTextStyle.body2:
        return const TextStyle(fontFamily: fontUnica, fontSize: 14, fontWeight: FontWeight.w500);
      case AppTextStyle.caption:
        return const TextStyle(fontFamily: fontUnica, fontSize: 12, fontWeight: FontWeight.w400);

      // --- BUTTONS / UI (Neue Haas Unica - Varios) ---
      case AppTextStyle.buttonMain:
        return const TextStyle(fontFamily: fontUnica, fontSize: 20, fontWeight: FontWeight.w500);
      case AppTextStyle.buttonLink:
        return const TextStyle(fontFamily: fontUnica, fontSize: 14, fontWeight: FontWeight.w500);
      case AppTextStyle.buttonCaption:
        return const TextStyle(fontFamily: fontUnica, fontSize: 12, fontWeight: FontWeight.w700); // Bold
      case AppTextStyle.textFill:
        return const TextStyle(fontFamily: fontUnica, fontSize: 18, fontWeight: FontWeight.w500);
    }
  }
}
