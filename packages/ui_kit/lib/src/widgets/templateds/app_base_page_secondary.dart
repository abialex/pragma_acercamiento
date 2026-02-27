import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Widget base para todas las páginas de la aplicación Pragma.
///
/// Gestiona la estructura de capas del fondo:
/// 1. Capa inferior: Gradiente lineal.
/// 2. Capa intermedia: Color sólido con opacidad (overlay).
/// 3. Capa superior: El Scaffold con el contenido ([body]).
class AppBasePageSecondary extends StatefulWidget {
  /// Tipo de fondo predefinido.

  /// Contenido principal de la página.
  final Widget body;

  /// Permite sobrescribir el color del overlay.
  final Color? customOverlayColor;

  /// Permite sobrescribir el gradiente.
  final LinearGradient? customGradient;

  /// Opacidad de la capa intermedia (por defecto 0.5).
  final double overlayOpacity;

  /// Mostrar AppBar por defecto.
  final bool isShowAppBar;

  /// Título del AppBar.
  final String? title;

  /// Ruta de la imagen del botón de retroceso.
  final String? imagePath;

  /// Acciones adicionales en el AppBar.
  final List<Widget>? actions;

  const AppBasePageSecondary({
    super.key,
    required this.body,
    this.customOverlayColor,
    this.customGradient,
    this.overlayOpacity = 0.5,
    this.isShowAppBar = true,
    this.title,
    this.imagePath,
    this.actions,
  });

  @override
  State<AppBasePageSecondary> createState() => _AppBasePageSecondaryState();
}

class _AppBasePageSecondaryState extends State<AppBasePageSecondary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isShowAppBar ? _buildAppBar(widget.imagePath) : null,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: SafeArea(
          top: true,
          child: SizedBox.expand(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: widget.body),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(String? imagePath) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: AppBackButton(imagePath: imagePath),
      automaticallyImplyLeading: false,
      title: widget.title != null ? AppText(widget.title!, variant: AppTextStyle.body1, color: colorRoles?.primary ?? Colors.orange) : null,
      centerTitle: true,
      actions: widget.actions,
    );
  }
}
