import 'package:flutter/material.dart';
import 'package:router_core/router_core.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';
import 'package:pragma_acercamiento/presentation/z_cat_module.dart';
import 'package:pragma_acercamiento/presentation/splash_screen.dart';

final appRouter = AppGoRouter<CatRoutes>(
  mainWrapperBuilder: (navigationShell) {
    return Scaffold(
      body: navigationShell,
      // You can add a BottomNavigationBar here later if you use branches
    );
  },
  routeModules: [CatModule()],
  updateCurrentRouteEvent: (CatRoutes route) {
    // You can register an event here to notify providers/blocs about current route
  },
  refreshListenable: null, // You can add an auth state listenable here
  pageSplashBuilder: () => const SplashPage(),
  initialLocation: CatRoutes.splash.path,
  getRouteEnumFromPath: (path) {
    return CatRoutes.values.firstWhere((route) => route.path == path, orElse: () => CatRoutes.splash);
  },
  getPathFromRouteEnum: (route) => route.path,
).router;
