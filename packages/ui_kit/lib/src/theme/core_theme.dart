import 'package:ui_kit/src/theme/color_roles.dart';
import 'package:flutter/material.dart';

/// Tema base compartido de la aplicación
///
/// Proporciona un método estático [buildTheme] que permite
/// configurar el tema usando [ColorRoles] personalizados.
class CoreTheme {
  const CoreTheme._();

  static ThemeData buildTheme({required ColorRoles colorRoles, required Brightness brightness, String fontFamily = 'NeueHaasUnica'}) {
    final colorScheme = colorRoles.toColorScheme(brightness: brightness);
    final textTheme = _buildTextTheme(colorScheme, fontFamily);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: 'NeueHaasUnica',

      // ========================================================================
      // APP BAR
      // ========================================================================
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surfaceTint,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),

      // ========================================================================
      // CARD
      // ========================================================================
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colorScheme.outlineVariant, width: 1),
        ),
        color: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        margin: const EdgeInsets.all(8),
      ),

      // ========================================================================
      // ELEVATED BUTTON
      // ========================================================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: null),
        ),
      ),

      // ========================================================================
      // FILLED BUTTON
      // ========================================================================
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: null),
        ),
      ),

      // ========================================================================
      // OUTLINED BUTTON
      // ========================================================================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          side: BorderSide(color: colorScheme.outline, width: 1),
          foregroundColor: colorScheme.primary,
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: null),
        ),
      ),

      // ========================================================================
      // TEXT BUTTON
      // ========================================================================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: colorScheme.primary,
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: null),
        ),
      ),

      // ========================================================================
      // INPUT DECORATION
      // ========================================================================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: textTheme.bodyLarge?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w500),
        hintStyle: textTheme.bodyLarge?.copyWith(color: colorScheme.primary.withValues(alpha: 0.5)),
        errorStyle: textTheme.bodySmall?.copyWith(color: colorScheme.error),
      ),

      // ========================================================================
      // FLOATING ACTION BUTTON
      // ========================================================================
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        highlightElevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),

      // ========================================================================
      // DIALOG
      // ========================================================================
      dialogTheme: DialogThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        titleTextStyle: textTheme.headlineSmall?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      ),

      // ========================================================================
      // BOTTOM SHEET
      // ========================================================================
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 3,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
      ),

      // ========================================================================
      // CHIP
      // ========================================================================
      chipTheme: ChipThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: colorScheme.outline, width: 1),
        ),
        backgroundColor: colorScheme.surface,
        selectedColor: colorScheme.secondaryContainer,
        labelStyle: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(color: colorScheme.onSecondaryContainer),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // ========================================================================
      // DIVIDER
      // ========================================================================
      dividerTheme: DividerThemeData(color: colorScheme.outlineVariant, thickness: 1, space: 1),

      // ========================================================================
      // ICON
      // ========================================================================
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),

      // ========================================================================
      // LIST TILE
      // ========================================================================
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        iconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
      ),

      // ========================================================================
      // SWITCH
      // ========================================================================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.onPrimary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.surfaceVariant;
        }),
      ),

      // ========================================================================
      // CHECKBOX
      // ========================================================================
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ========================================================================
      // RADIO
      // ========================================================================
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurfaceVariant;
        }),
      ),

      // ========================================================================
      // SNACKBAR
      // ========================================================================
      snackBarTheme: SnackBarThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onInverseSurface),
      ),

      // ========================================================================
      // PROGRESS INDICATOR
      // ========================================================================
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
        circularTrackColor: colorScheme.surfaceContainerHighest,
      ),

      // ========================================================================
      // SCAFFOLD
      // ========================================================================
      scaffoldBackgroundColor: colorScheme.surface,

      // Custom ThemeExtensions (ColorRoles)
      extensions: <ThemeExtension<dynamic>>[colorRoles],
    );
  }

  /// Construye el TextTheme personalizado
  static TextTheme _buildTextTheme(ColorScheme colorScheme, String fontFamily) {
    final baseTextTheme = ThemeData(fontFamily: fontFamily).textTheme;

    return baseTextTheme.copyWith(
      // Display
      displayLarge: baseTextTheme.displayLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displayMedium: baseTextTheme.displayMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: baseTextTheme.displaySmall?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w400),

      // Headline
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),

      // Title
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
      titleMedium: baseTextTheme.titleMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600),
      titleSmall: baseTextTheme.titleSmall?.copyWith(color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600),

      // Body
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w400),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w400),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w400),

      // Label
      labelLarge: baseTextTheme.labelLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600, letterSpacing: 0.1),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    );
  }
}
