// import 'package:ui_kit/src/theme/color_roles.dart';
// import 'package:flutter/material.dart';

// /// Capa 3: Tokens Semánticos de Color
// ///
// /// Tokens específicos para componentes y contextos de uso.
// class ColorTokens {
//   const ColorTokens(this.roles);

//   final ColorRoles roles;

//   // ============================================================================
//   // UI TOKENS
//   // ============================================================================
//   Color get uiBackground => roles.background;
//   Color get uiSurface => roles.surface;
//   Color get uiSurfaceVariant => roles.surfaceVariant;
//   Color get uiDivider => roles.outlineVariant;
//   Color get uiBorder => roles.outline;
//   Color get uiShadow => roles.shadow;
//   Color get uiOverlay => roles.scrim;
//   Color get uiSurfaceTint => roles.surfaceTint;
//   Color get uiInverseSurface => roles.inverseSurface;

//   // ============================================================================
//   // TEXT TOKENS
//   // ============================================================================
//   Color get textPrimary => roles.onBackground;
//   Color get textSecondary => roles.onSurfaceVariant;
//   Color get textDisabled => roles.onSurfaceVariant.withOpacity(0.38);
//   Color get textPlaceholder => roles.onSurfaceVariant.withOpacity(0.6);
//   Color get textLink => roles.primary;
//   Color get textOnPrimary => roles.onPrimary;
//   Color get textOnSecondary => roles.onSecondary;
//   Color get textOnSurface => roles.onSurface;
//   Color get textInverse => roles.inverseOnSurface;

//   // ============================================================================
//   // BUTTON TOKENS
//   // ============================================================================
//   Color get buttonPrimary => roles.primary;
//   Color get buttonOnPrimary => roles.onPrimary;
//   Color get buttonSecondary => roles.secondary;
//   Color get buttonOnSecondary => roles.onSecondary;
//   Color get buttonTertiary => roles.tertiary;
//   Color get buttonOnTertiary => roles.onTertiary;
//   Color get buttonDisabled => roles.onSurface.withOpacity(0.12);
//   Color get buttonTextDisabled => roles.onSurface.withOpacity(0.38);
//   Color get buttonHover => roles.primary.withOpacity(0.08);
//   Color get buttonPressed => roles.primary.withOpacity(0.12);
//   Color get buttonFocus => roles.primary.withOpacity(0.12);

//   // ============================================================================
//   // STATE TOKENS
//   // ============================================================================
//   Color get stateSuccess => roles.primary;
//   Color get stateOnSuccess => roles.onPrimary;
//   Color get stateSuccessContainer => roles.primaryContainer;
//   Color get stateOnSuccessContainer => roles.onPrimaryContainer;

//   Color get stateError => roles.error;
//   Color get stateOnError => roles.onError;
//   Color get stateErrorContainer => roles.errorContainer;
//   Color get stateOnErrorContainer => roles.onErrorContainer;

//   Color get stateWarning => roles.tertiary;
//   Color get stateOnWarning => roles.onTertiary;
//   Color get stateWarningContainer => roles.tertiaryContainer;
//   Color get stateOnWarningContainer => roles.onTertiaryContainer;

//   Color get stateInfo => roles.secondary;
//   Color get stateOnInfo => roles.onSecondary;
//   Color get stateInfoContainer => roles.secondaryContainer;
//   Color get stateOnInfoContainer => roles.onSecondaryContainer;

//   Color get stateNeutral => roles.surfaceVariant;
//   Color get stateOnNeutral => roles.onSurfaceVariant;

//   Color get stateCalm => roles.tertiary;
//   Color get stateOnCalm => roles.onTertiary;

//   // ============================================================================
//   // INTERACTIVE TOKENS
//   // ============================================================================
//   Color get interactiveHover => roles.onSurface.withOpacity(0.08);
//   Color get interactivePressed => roles.onSurface.withOpacity(0.12);
//   Color get interactiveFocus => roles.primary.withOpacity(0.12);
//   Color get interactiveDrag => roles.primary.withOpacity(0.16);

//   Color get interactiveSelected => roles.primaryContainer;
//   Color get interactiveOnSelected => roles.onPrimaryContainer;

//   // ============================================================================
//   // INPUT TOKENS
//   // ============================================================================
//   Color get inputBackground => roles.surfaceVariant;
//   Color get inputBorder => roles.outline;
//   Color get inputBorderFocus => roles.primary;
//   Color get inputBorderError => roles.error;
//   Color get inputText => roles.onSurface;
//   Color get inputLabel => roles.onSurfaceVariant;
//   Color get inputHelper => roles.onSurfaceVariant;
//   Color get inputError => roles.error;

//   // ============================================================================
//   // CONTAINER TOKENS
//   // ============================================================================
//   Color get cardBackground => roles.surface;
//   Color get cardBorder => roles.outlineVariant;
//   Color get cardElevated => roles.surface;

//   Color get containerPrimary => roles.primaryContainer;
//   Color get containerOnPrimary => roles.onPrimaryContainer;
//   Color get containerSecondary => roles.secondaryContainer;
//   Color get containerOnSecondary => roles.onSecondaryContainer;
//   Color get containerTertiary => roles.tertiaryContainer;
//   Color get containerOnTertiary => roles.onTertiaryContainer;
// }
