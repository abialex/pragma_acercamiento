import 'package:flutter/material.dart';
import 'package:router_core/router_core.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';
import 'package:pragma_acercamiento/presentation/z_cat_module.dart';
import 'package:pragma_acercamiento/presentation/splash_screen.dart';

@visibleForTesting
Widget appMainWrapperBuilder(Widget navigationShell) {
  return Scaffold(
    body: navigationShell,
    // You can add a BottomNavigationBar here later if you use branches
  );
}

@visibleForTesting
void appUpdateCurrentRouteEvent(CatRoutes route) {
  // You can register an event here to notify providers/blocs about current route
}

@visibleForTesting
Widget appPageSplashBuilder() => const SplashPage();

@visibleForTesting
CatRoutes appGetRouteEnumFromPath(String path) {
  return CatRoutes.values.firstWhere((route) => route.path == path, orElse: () => CatRoutes.splash);
}

@visibleForTesting
String appGetPathFromRouteEnum(CatRoutes route) => route.path;

final appRouter = AppGoRouter<CatRoutes>(
  mainWrapperBuilder: appMainWrapperBuilder,
  routeModules: [CatModule()],
  updateCurrentRouteEvent: appUpdateCurrentRouteEvent,
  refreshListenable: null, // You can add an auth state listenable here
  pageSplashBuilder: appPageSplashBuilder,
  initialLocation: CatRoutes.splash.path,
  getRouteEnumFromPath: appGetRouteEnumFromPath,
  getPathFromRouteEnum: appGetPathFromRouteEnum,
).router;
