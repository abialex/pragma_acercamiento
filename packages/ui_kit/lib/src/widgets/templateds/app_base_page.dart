import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Widget base para todas las páginas de la aplicación Pragma.
///
/// Gestiona la estructura de capas del fondo:
/// 1. Capa inferior: Gradiente lineal.
/// 2. Capa intermedia: Color sólido con opacidad (overlay).
/// 3. Capa superior: El Scaffold con el contenido ([body]).
class AppBasePage extends StatefulWidget {
  /// Tipo de fondo predefinido.
  final AppBackgroundType type;

  /// Contenido principal de la página.
  final Widget body;

  /// Permite sobrescribir el color del overlay.
  final Color? customOverlayColor;

  /// Permite sobrescribir el gradiente.
  final LinearGradient? customGradient;

  /// Opacidad de la capa intermedia (por defecto 0.5).
  final double? overlayOpacity;

  /// Propiedades opcionales del Scaffold.
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final bool resizeToAvoidBottomInset;

  const AppBasePage({
    super.key,
    this.type = AppBackgroundType.type1,
    required this.body,
    this.customOverlayColor,
    this.customGradient,
    this.overlayOpacity,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  State<AppBasePage> createState() => _AppBasePageState();
}

class _AppBasePageState extends State<AppBasePage> {
  @override
  Widget build(BuildContext context) {
    final gradient = widget.customGradient ?? _getGradientForType(widget.type);
    final overlayColor = widget.customOverlayColor ?? _getOverlayColorForType(widget.type);

    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      backgroundColor: Colors.white, // El fondo lo maneja el Stack inferior
      body: Stack(
        children: [
          // Capa 1: Gradiente Base
          Positioned.fill(
            child: Container(decoration: BoxDecoration(gradient: gradient)),
          ),
          // Capa 2: Overlay Color
          Positioned.fill(
            child: Container(color: overlayColor.withValues(alpha: widget.overlayOpacity)),
          ),
          // Capa 3: Contenido
          SafeArea(
            top: true,
            child: SizedBox.expand(
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25), child: widget.body),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getGradientForType(AppBackgroundType type) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    switch (type) {
      case AppBackgroundType.type1: // Rojo a Naranja (Splash / Principal)
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFD84315), // Rojo-naranja (top)
            Color(0xFFE64A19), // Naranja rojizo
            Color(0xFFFF5722), // Naranja
            Color(0xFFFF6F00), // Naranja medio
            Color(0xFFFF8F00), // Naranja
            Color(0xFFFFAB40), // Naranja claro (bottom)
          ],
        );
      case AppBackgroundType.type2: // Naranja a Naranja Claro
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE64A19), // Rojo-naranja (top)
            Color(0xFFFF5722), // Naranja
            Color(0xFFFF7043), // Naranja medio
            Color(0xFFFF8A65), // Naranja claro
            Color(0xFFFFAB91), // Melocotón
            Color(0xFFFFCCBC), // Durazno claro (bottom)
          ],
        );
      case AppBackgroundType.type3: // Oscuro (Gris a Carbon)
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorRoles?.secondary ?? Colors.transparent, colorRoles?.white ?? Colors.transparent],
          stops: [0.0, 1.0],
        );
      case AppBackgroundType.type4: // Peach Soft
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorRoles?.white ?? Colors.transparent, colorRoles?.gradientSecondary ?? Colors.transparent],
          stops: [0.0, 1.0],
        );
      case AppBackgroundType.type5: // Blanco / Neutro
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorRoles?.gradientPrimary ?? Colors.transparent, colorRoles?.gradientSecondary ?? Colors.transparent],
          stops: [0, 1.0],
        );
      case AppBackgroundType.type6: // Gradiente Inverso
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorPrimitives.orangePrimary700, ColorPrimitives.redAccent500],
        );
      case AppBackgroundType.type7: // Gradiente Inverso
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorPrimitives.neutral0, ColorPrimitives.neutral50],
        );
      case AppBackgroundType.type8: // Gradiente Inverso
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorRoles?.gradientSecondary ?? Colors.transparent,
            colorRoles?.gradientSecondary.withValues(alpha: 0.2) ?? Colors.transparent,
          ],
          stops: const [0, 1.0],
        );
      case AppBackgroundType.darkSolid:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorRoles?.background ?? Colors.transparent, colorRoles?.background ?? Colors.transparent],
        );
    }
  }

  Color _getOverlayColorForType(AppBackgroundType type) {
    switch (type) {
      case AppBackgroundType.type1:
        return ColorPrimitives.orangePrimary900.withValues(alpha: 0.5);
      case AppBackgroundType.type2:
        return ColorPrimitives.transparent;
      case AppBackgroundType.type6:
        return ColorPrimitives.orangePrimary900;
      case AppBackgroundType.type3:
        return Colors.white.withValues(alpha: 0.5);
      case AppBackgroundType.type4:
        return Colors.white.withValues(alpha: 0.5);
      case AppBackgroundType.type5:
        return Colors.white.withValues(alpha: 0);
      case AppBackgroundType.type7:
        return Colors.white.withValues(alpha: 0);
      case AppBackgroundType.type8:
        return Colors.white.withValues(alpha: 0.5);
      case AppBackgroundType.darkSolid:
        return Colors.transparent;
    }
  }
}
