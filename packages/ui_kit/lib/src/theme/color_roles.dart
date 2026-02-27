import 'package:flutter/material.dart';

/// Capa 2: Roles Funcionales de Color
///
/// Define roles semánticos basados en Material Design 3 con soporte para
/// modo claro y oscuro. Estos roles mapean los primitivos a funciones
/// específicas en la UI.
class ColorRoles extends ThemeExtension<ColorRoles> {
  const ColorRoles({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.surfaceTint,
    required this.surfaceContainer,
    // Jornada / Semantic state colors
    required this.jornadaSuccess,
    required this.onJornadaSuccess,
    required this.jornadaSuccessContainer,
    required this.onJornadaSuccessContainer,
    required this.jornadaWarning,
    required this.onJornadaWarning,
    required this.jornadaWarningContainer,
    required this.onJornadaWarningContainer,
    required this.jornadaDanger,
    required this.onJornadaDanger,
    required this.jornadaDangerContainer,
    required this.onJornadaDangerContainer,
    required this.jornadaNeutral,
    required this.onJornadaNeutral,
    required this.jornadaNeutralContainer,
    required this.onJornadaNeutralContainer,
    // Monedas
    required this.monedaPen,
    required this.monedaUsd,
    // Ocupacion
    required this.ocupacion,
    // Indisponibilidad
    required this.indisponibilidad,
    // Movimientos
    required this.movimientoTransferencia,
    required this.movimientoRetiro,
    required this.movimientoReposicion,
    required this.movimientoEgreso,
    required this.movimientoIngreso,
    // Gradients
    required this.gradientPrimary,
    required this.gradientSecondary,
    required this.gradientTerciary,
    required this.white,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;

  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;

  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;

  final Color outline;
  final Color outlineVariant;

  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color surfaceTint;
  final Color surfaceContainer;

  final Color jornadaSuccess;
  final Color onJornadaSuccess;
  final Color jornadaSuccessContainer;
  final Color onJornadaSuccessContainer;

  final Color jornadaWarning;
  final Color onJornadaWarning;
  final Color jornadaWarningContainer;
  final Color onJornadaWarningContainer;

  final Color jornadaDanger;
  final Color onJornadaDanger;
  final Color jornadaDangerContainer;
  final Color onJornadaDangerContainer;

  final Color jornadaNeutral;
  final Color onJornadaNeutral;
  final Color jornadaNeutralContainer;
  final Color onJornadaNeutralContainer;

  final Color monedaPen;
  final Color monedaUsd;

  final Color ocupacion;

  final Color indisponibilidad;

  final Color movimientoTransferencia;
  final Color movimientoRetiro;
  final Color movimientoReposicion;
  final Color movimientoEgreso;
  final Color movimientoIngreso;
  final Color gradientPrimary;
  final Color gradientSecondary;
  final Color gradientTerciary;
  final Color white;

  /// Convierte los roles a un ColorScheme de Material Design 3
  ColorScheme toColorScheme({required Brightness brightness}) {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
      surfaceTint: surfaceTint,
    );
  }

  @override
  ColorRoles copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? inversePrimary,
    Color? surfaceTint,
    Color? surfaceContainer,
    Color? jornadaSuccess,
    Color? onJornadaSuccess,
    Color? jornadaSuccessContainer,
    Color? onJornadaSuccessContainer,
    Color? jornadaWarning,
    Color? onJornadaWarning,
    Color? jornadaWarningContainer,
    Color? onJornadaWarningContainer,
    Color? jornadaDanger,
    Color? onJornadaDanger,
    Color? jornadaDangerContainer,
    Color? onJornadaDangerContainer,
    Color? jornadaNeutral,
    Color? onJornadaNeutral,
    Color? jornadaNeutralContainer,
    Color? onJornadaNeutralContainer,
    Color? monedaPen,
    Color? monedaUsd,
    Color? ocupacion,
    Color? indisponibilidad,
    Color? movimientoTransferencia,
    Color? movimientoRetiro,
    Color? movimientoReposicion,
    Color? movimientoEgreso,
    Color? movimientoIngreso,
    Color? primaryGradientStart,
    Color? primaryGradientEnd,
    Color? peachGradientStart,
    Color? peachGradientEnd,
    Color? orangeGradientStart,
    Color? orangeGradientEnd,
    Color? white,
    Color? gradientPrimary,
    Color? gradientSecondary,
    Color? gradientTerciary,
  }) {
    return ColorRoles(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      jornadaSuccess: jornadaSuccess ?? this.jornadaSuccess,
      onJornadaSuccess: onJornadaSuccess ?? this.onJornadaSuccess,
      jornadaSuccessContainer: jornadaSuccessContainer ?? this.jornadaSuccessContainer,
      onJornadaSuccessContainer: onJornadaSuccessContainer ?? this.onJornadaSuccessContainer,
      jornadaWarning: jornadaWarning ?? this.jornadaWarning,
      onJornadaWarning: onJornadaWarning ?? this.onJornadaWarning,
      jornadaWarningContainer: jornadaWarningContainer ?? this.jornadaWarningContainer,
      onJornadaWarningContainer: onJornadaWarningContainer ?? this.onJornadaWarningContainer,
      jornadaDanger: jornadaDanger ?? this.jornadaDanger,
      onJornadaDanger: onJornadaDanger ?? this.onJornadaDanger,
      jornadaDangerContainer: jornadaDangerContainer ?? this.jornadaDangerContainer,
      onJornadaDangerContainer: onJornadaDangerContainer ?? this.onJornadaDangerContainer,
      jornadaNeutral: jornadaNeutral ?? this.jornadaNeutral,
      onJornadaNeutral: onJornadaNeutral ?? this.onJornadaNeutral,
      jornadaNeutralContainer: jornadaNeutralContainer ?? this.jornadaNeutralContainer,
      onJornadaNeutralContainer: onJornadaNeutralContainer ?? this.onJornadaNeutralContainer,
      monedaPen: monedaPen ?? this.monedaPen,
      monedaUsd: monedaUsd ?? this.monedaUsd,
      ocupacion: ocupacion ?? this.ocupacion,
      indisponibilidad: indisponibilidad ?? this.indisponibilidad,
      movimientoTransferencia: movimientoTransferencia ?? this.movimientoTransferencia,
      movimientoRetiro: movimientoRetiro ?? this.movimientoRetiro,
      movimientoReposicion: movimientoReposicion ?? this.movimientoReposicion,
      movimientoEgreso: movimientoEgreso ?? this.movimientoEgreso,
      movimientoIngreso: movimientoIngreso ?? this.movimientoIngreso,
      white: white ?? this.white,
      gradientPrimary: gradientPrimary ?? this.gradientPrimary,
      gradientSecondary: gradientSecondary ?? this.gradientSecondary,
      gradientTerciary: gradientTerciary ?? this.gradientTerciary,
    );
  }

  @override
  ColorRoles lerp(ThemeExtension<ColorRoles>? other, double t) {
    if (other is! ColorRoles) return this;
    return ColorRoles(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer: Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer: Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant: Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      inverseOnSurface: Color.lerp(inverseOnSurface, other.inverseOnSurface, t)!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      jornadaSuccess: Color.lerp(jornadaSuccess, other.jornadaSuccess, t)!,
      onJornadaSuccess: Color.lerp(onJornadaSuccess, other.onJornadaSuccess, t)!,
      jornadaSuccessContainer: Color.lerp(jornadaSuccessContainer, other.jornadaSuccessContainer, t)!,
      onJornadaSuccessContainer: Color.lerp(onJornadaSuccessContainer, other.onJornadaSuccessContainer, t)!,
      jornadaWarning: Color.lerp(jornadaWarning, other.jornadaWarning, t)!,
      onJornadaWarning: Color.lerp(onJornadaWarning, other.onJornadaWarning, t)!,
      jornadaWarningContainer: Color.lerp(jornadaWarningContainer, other.jornadaWarningContainer, t)!,
      onJornadaWarningContainer: Color.lerp(onJornadaWarningContainer, other.onJornadaWarningContainer, t)!,
      jornadaDanger: Color.lerp(jornadaDanger, other.jornadaDanger, t)!,
      onJornadaDanger: Color.lerp(onJornadaDanger, other.onJornadaDanger, t)!,
      jornadaDangerContainer: Color.lerp(jornadaDangerContainer, other.jornadaDangerContainer, t)!,
      onJornadaDangerContainer: Color.lerp(onJornadaDangerContainer, other.onJornadaDangerContainer, t)!,
      jornadaNeutral: Color.lerp(jornadaNeutral, other.jornadaNeutral, t)!,
      onJornadaNeutral: Color.lerp(onJornadaNeutral, other.onJornadaNeutral, t)!,
      jornadaNeutralContainer: Color.lerp(jornadaNeutralContainer, other.jornadaNeutralContainer, t)!,
      onJornadaNeutralContainer: Color.lerp(onJornadaNeutralContainer, other.onJornadaNeutralContainer, t)!,
      monedaPen: Color.lerp(monedaPen, other.monedaPen, t)!,
      monedaUsd: Color.lerp(monedaUsd, other.monedaUsd, t)!,
      ocupacion: Color.lerp(ocupacion, other.ocupacion, t)!,
      indisponibilidad: Color.lerp(indisponibilidad, other.indisponibilidad, t)!,
      movimientoTransferencia: Color.lerp(movimientoTransferencia, other.movimientoTransferencia, t)!,
      movimientoRetiro: Color.lerp(movimientoRetiro, other.movimientoRetiro, t)!,
      movimientoReposicion: Color.lerp(movimientoReposicion, other.movimientoReposicion, t)!,
      movimientoEgreso: Color.lerp(movimientoEgreso, other.movimientoEgreso, t)!,
      movimientoIngreso: Color.lerp(movimientoIngreso, other.movimientoIngreso, t)!,
      gradientPrimary: Color.lerp(gradientPrimary, other.gradientPrimary, t)!,
      gradientSecondary: Color.lerp(gradientSecondary, other.gradientSecondary, t)!,
      gradientTerciary: Color.lerp(gradientTerciary, other.gradientTerciary, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}

extension ColorRolesExtension on BuildContext {
  ColorRoles get colorRoles => Theme.of(this).extension<ColorRoles>()!;
}
