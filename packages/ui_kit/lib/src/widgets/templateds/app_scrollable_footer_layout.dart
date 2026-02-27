import 'package:flutter/material.dart';

/// Un layout responsivo que permite que el contenido sea escroleable si el espacio es insuficiente,
/// pero mantiene el [footer] siempre en la parte inferior de la pantalla si hay espacio de sobra.
///
/// Este widget utiliza el patrón de `LayoutBuilder` + `SingleChildScrollView` + `ConstrainedBox` + `IntrinsicHeight`.
class AppScrollableFooterLayout extends StatelessWidget {
  /// Lista de widgets que forman el contenido principal (arriba).
  final List<Widget> children;

  /// Lista de widgets que forman el footer (abajo). Siempre se verán al final.
  final List<Widget> footer;

  /// Espaciado interno del contenedor.
  final EdgeInsetsGeometry padding;

  /// Alineación horizontal de los elementos en la columna.
  final CrossAxisAlignment crossAxisAlignment;

  /// Espaciado entre elementos de la lista principal.
  final double spacing;

  const AppScrollableFooterLayout({
    super.key,
    required this.children,
    required this.footer,
    this.padding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: crossAxisAlignment,
                  spacing: spacing,
                  children: [
                    ...children,
                    const Spacer(),
                    ...footer,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
