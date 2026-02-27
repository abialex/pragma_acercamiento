// app/lib/widgets/responsive_wrapper.dart
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart'; // Importas tu kit

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // 1. Obtenemos el ancho real del dispositivo
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;

    // 2. Obtenemos el ancho del diseño de Figma desde el Provider del UI Kit
    final config = UIkitConfigProvider.maybeOf(context);

    if (config == null) {
      throw FlutterError(
        'ResponsiveWrapper: No se encontró UIkitConfigProvider en el árbol de widgets. '
        'Asegúrate de envolver tu MaterialApp (o el widget donde uses esto) con UIkitConfigProvider.',
      );
    }

    final double figmaWidth = config.designWidth;

    if (figmaWidth <= 0) {
      throw FlutterError(
        'ResponsiveWrapper: El valor de designWidth en UIkitConfigProvider debe ser mayor a cero. '
        'Valor actual: $figmaWidth',
      );
    }

    // 3. Calculamos el factor de la "Regla de 3"
    final double scaleFactor = (screenWidth - screenWidth * 0.1) / figmaWidth;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        // Aplicamos el factor al TextScaler.
        // Esto escalará TODOS los textos de la app proporcionalmente.
        textScaler: TextScaler.linear(scaleFactor.clamp(0.8, 1.2)),
      ),
      child: child,
    );
  }
}
