import 'package:ui_kit/src/theme/color_primitives.dart';
import 'package:ui_kit/src/theme/color_roles.dart';
import 'package:ui_kit/src/theme/core_theme.dart';
import 'package:flutter/material.dart';

/// Tema de Pragma
///
/// Define los temas light y dark de la aplicación Pragma
/// usando los ColorPrimitives para construir ColorRoles semánticos.
class PragmaTheme {
  PragmaTheme._();

  /// ColorRoles para modo claro
  static ColorRoles get lightRoles => const ColorRoles(
    // Primary - Orange Dark (PMS 1655 C) - Color Primario
    primary: ColorPrimitives.orangeLight500,
    onPrimary: ColorPrimitives.neutral0,
    primaryContainer: ColorPrimitives.orangePrimary100,
    onPrimaryContainer: ColorPrimitives.orangePrimary900,

    // Secondary - Peach (PMS 712 C) - Color Secundario
    secondary: ColorPrimitives.peachSecondary500,
    onSecondary: ColorPrimitives.neutral900,
    secondaryContainer: ColorPrimitives.neutral50, // #EBE5DE
    onSecondaryContainer: ColorPrimitives.neutral900,

    // Tertiary - Style for buttons on gradients (White with Primary text)
    tertiary: ColorPrimitives.neutral0,
    onTertiary: ColorPrimitives.orangePrimary500,
    tertiaryContainer: ColorPrimitives.peachSecondary100,
    onTertiaryContainer: ColorPrimitives.neutral900,

    // Error
    error: ColorPrimitives.redPrimary,
    onError: ColorPrimitives.neutral0,
    errorContainer: ColorPrimitives.error100,
    onErrorContainer: ColorPrimitives.error900,

    // Background & Surface
    background: ColorPrimitives.neutral0,
    onBackground: ColorPrimitives.neutral900,
    surface: ColorPrimitives.neutral0,
    onSurface: ColorPrimitives.neutral900,
    surfaceVariant: ColorPrimitives.neutral50,
    onSurfaceVariant: ColorPrimitives.neutral700,

    // Outline
    outline: ColorPrimitives.neutral400,
    outlineVariant: ColorPrimitives.neutral50,

    // Shadow & Scrim
    shadow: ColorPrimitives.neutral1000,
    scrim: ColorPrimitives.scrim,

    // Inverse
    inverseSurface: ColorPrimitives.neutral900,
    inverseOnSurface: ColorPrimitives.neutral50,
    inversePrimary: ColorPrimitives.orangePrimary100,

    // Surface Tint
    surfaceTint: ColorPrimitives.orangePrimary500,
    surfaceContainer: ColorPrimitives.neutral50, // #EBE5DE
    // Jornada Success (usando Success palette)
    jornadaSuccess: ColorPrimitives.success500,
    onJornadaSuccess: ColorPrimitives.neutral0,
    jornadaSuccessContainer: ColorPrimitives.success100,
    onJornadaSuccessContainer: ColorPrimitives.success900,

    // Jornada Warning (usando Warning palette)
    jornadaWarning: ColorPrimitives.warning500,
    onJornadaWarning: ColorPrimitives.neutral900,
    jornadaWarningContainer: ColorPrimitives.warning100,
    onJornadaWarningContainer: ColorPrimitives.warning900,

    // Jornada Danger (usando Red Accent palette - PMS 3516 C)
    jornadaDanger: ColorPrimitives.redAccent500,
    onJornadaDanger: ColorPrimitives.neutral0,
    jornadaDangerContainer: ColorPrimitives.redAccent100,
    onJornadaDangerContainer: ColorPrimitives.redAccent900,

    // Jornada Neutral (usando Neutral palette)
    jornadaNeutral: ColorPrimitives.neutral500,
    onJornadaNeutral: ColorPrimitives.neutral0,
    jornadaNeutralContainer: ColorPrimitives.neutral100,
    onJornadaNeutralContainer: ColorPrimitives.neutral900,

    // Monedas
    monedaPen: ColorPrimitives.monedaPen500,
    monedaUsd: ColorPrimitives.monedaUsd500,

    // Ocupación
    ocupacion: ColorPrimitives.ocupacion400,

    // Indisponibilidad
    indisponibilidad: ColorPrimitives.indisponibilidad400,

    // Movimientos
    movimientoTransferencia: ColorPrimitives.orangePrimary500,
    movimientoRetiro: ColorPrimitives.redAccent500,
    movimientoReposicion: ColorPrimitives.warning500,
    movimientoEgreso: ColorPrimitives.redAccent600,
    movimientoIngreso: ColorPrimitives.success600,

    // Gradients
    gradientPrimary: ColorPrimitives.orangeLight500,
    gradientSecondary: ColorPrimitives.peachSecondary500,
    gradientTerciary: ColorPrimitives.redPrimary,
    white: ColorPrimitives.neutral0,
  );

  /// ColorRoles para modo oscuro
  static ColorRoles get darkRoles => const ColorRoles(
    // Primary - Orange (tono más claro para contraste en dark)
    primary: ColorPrimitives.orangePrimary200,
    onPrimary: ColorPrimitives.orangePrimary900,
    primaryContainer: ColorPrimitives.orangePrimary700,
    onPrimaryContainer: ColorPrimitives.orangePrimary100,

    // Secondary - Peach
    secondary: ColorPrimitives.peachSecondary200,
    onSecondary: ColorPrimitives.peachSecondary900,
    secondaryContainer: ColorPrimitives.peachSecondary700,
    onSecondaryContainer: ColorPrimitives.peachSecondary100,

    // Tertiary - Light Orange
    tertiary: ColorPrimitives.orangeLight200,
    onTertiary: ColorPrimitives.orangeLight900,
    tertiaryContainer: ColorPrimitives.orangeLight700,
    onTertiaryContainer: ColorPrimitives.orangeLight100,

    // Error
    error: ColorPrimitives.error300,
    onError: ColorPrimitives.error900,
    errorContainer: ColorPrimitives.error700,
    onErrorContainer: ColorPrimitives.error100,

    // Background & Surface
    background: ColorPrimitives.neutral900,
    onBackground: ColorPrimitives.neutral50,
    surface: ColorPrimitives.neutral900,
    onSurface: ColorPrimitives.neutral50,
    surfaceVariant: ColorPrimitives.neutral800,
    onSurfaceVariant: ColorPrimitives.neutral200,

    // Outline
    outline: ColorPrimitives.neutral600,
    outlineVariant: ColorPrimitives.neutral700,

    // Shadow & Scrim
    shadow: ColorPrimitives.neutral1000,
    scrim: ColorPrimitives.scrim,

    // Inverse
    inverseSurface: ColorPrimitives.neutral50,
    inverseOnSurface: ColorPrimitives.neutral900,
    inversePrimary: ColorPrimitives.orangePrimary600,

    // Surface Tint
    surfaceTint: ColorPrimitives.orangePrimary200,
    surfaceContainer: ColorPrimitives.neutral800,

    // Jornada Success
    jornadaSuccess: ColorPrimitives.success300,
    onJornadaSuccess: ColorPrimitives.success900,
    jornadaSuccessContainer: ColorPrimitives.success700,
    onJornadaSuccessContainer: ColorPrimitives.success100,

    // Jornada Warning
    jornadaWarning: ColorPrimitives.warning300,
    onJornadaWarning: ColorPrimitives.warning900,
    jornadaWarningContainer: ColorPrimitives.warning700,
    onJornadaWarningContainer: ColorPrimitives.warning100,

    // Jornada Danger
    jornadaDanger: ColorPrimitives.redAccent300,
    onJornadaDanger: ColorPrimitives.redAccent900,
    jornadaDangerContainer: ColorPrimitives.redAccent700,
    onJornadaDangerContainer: ColorPrimitives.redAccent100,

    // Jornada Neutral
    jornadaNeutral: ColorPrimitives.neutral400,
    onJornadaNeutral: ColorPrimitives.neutral900,
    jornadaNeutralContainer: ColorPrimitives.neutral700,
    onJornadaNeutralContainer: ColorPrimitives.neutral100,

    // Monedas
    monedaPen: ColorPrimitives.monedaPen300,
    monedaUsd: ColorPrimitives.monedaUsd300,

    // Ocupación
    ocupacion: ColorPrimitives.ocupacion300,

    // Indisponibilidad
    indisponibilidad: ColorPrimitives.indisponibilidad500,

    // Movimientos
    movimientoTransferencia: ColorPrimitives.orangePrimary300,
    movimientoRetiro: ColorPrimitives.redAccent300,
    movimientoReposicion: ColorPrimitives.warning300,
    movimientoEgreso: ColorPrimitives.redAccent400,
    movimientoIngreso: ColorPrimitives.success400,

    // Gradients
    gradientPrimary: ColorPrimitives.orangePrimary300,
    gradientSecondary: ColorPrimitives.peachSecondary300,
    gradientTerciary: ColorPrimitives.orangeLight300,
    white: ColorPrimitives.neutral0,
  );

  /// ColorRoles para modo oscuro con los colores de marca Pragma (violet/purple)
  ///
  /// Extiende [darkRoles] sobreescribiendo solo los tokens que Pragma
  /// personaliza, manteniendo el resto del sistema de diseño intacto.
  static ColorRoles get pragmaDarkRoles => darkRoles.copyWith(
    primary: PragmaColors.violet500,
    onPrimary: PragmaColors.white,
    secondary: PragmaColors.violet600,
    onSecondary: PragmaColors.white,
    surface: PragmaColors.purple800,
    onSurface: PragmaColors.white,
    background: PragmaColors.purple900,
    onBackground: PragmaColors.white,
    surfaceContainer: PragmaColors.purple800,
    onSurfaceVariant: PragmaColors.glassWhite,
    outline: PragmaColors.white.withValues(alpha: 0.05),
    surfaceTint: PragmaColors.violet500,
  );

  /// ThemeData para modo claro
  static ThemeData get lightTheme => CoreTheme.buildTheme(colorRoles: lightRoles, brightness: Brightness.light, fontFamily: 'Inter');

  /// ThemeData para modo oscuro — usa [pragmaDarkRoles] para aplicar
  /// los colores de marca Pragma sobre la base de [darkRoles].
  static ThemeData get darkTheme => CoreTheme.buildTheme(colorRoles: pragmaDarkRoles, brightness: Brightness.dark, fontFamily: 'Inter');
}
