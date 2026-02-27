import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Observador personalizado para monitorear la navegación
class AppGoRouterObserver extends NavigatorObserver {
  final void Function(String?)? onRouteChange;

  AppGoRouterObserver({this.onRouteChange});

  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    onRouteChange?.call(topRoute.settings.name);
    super.didChangeTop(topRoute, previousTopRoute);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      // AppLogger.logDebug('🚀 Nueva ruta empujada: ${route.settings.name}');
      // AppLogger.logDebug('⬅️ Ruta anterior: ${previousRoute?.settings.name}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      // AppLogger.logDebug('👈 Ruta eliminada: ${route.settings.name}');
      // AppLogger.logDebug('➡️ Volviendo a: ${previousRoute?.settings.name}');
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      // AppLogger.logDebug('🗑️ Ruta removida: ${route.settings.name}');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (kDebugMode) {
      // AppLogger.logDebug('🔄 Ruta reemplazada: ${oldRoute?.settings.name}');
      // AppLogger.logDebug('✨ Nueva ruta: ${newRoute?.settings.name}');
    }
  }
}
