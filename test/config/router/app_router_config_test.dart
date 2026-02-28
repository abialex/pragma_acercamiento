import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_acercamiento/config/router/app_router_config.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';

void main() {
  group('App Router Config', () {
    test('should have a configured GoRouter instance', () {
      expect(appRouter, isA<GoRouter>());
    });

    // Test the custom Enum resolution logic in the config
    test('should get CatRoutes enum from path', () {
      final route = appGetRouteEnumFromPath('/listcat');
      expect(route, CatRoutes.listcat);

      final splashRoute = appGetRouteEnumFromPath('/non-existent-path');
      expect(splashRoute, CatRoutes.splash);
    });

    test('should get path from route enum', () {
      final path = appGetPathFromRouteEnum(CatRoutes.listcat);
      expect(path, '/listcat');
    });

    testWidgets('should build main wrapper with Scaffold', (tester) async {
      await tester.pumpWidget(MaterialApp(home: appMainWrapperBuilder(const Text('Test Shell'))));
      expect(find.text('Test Shell'), findsOneWidget);
    });

    test('should return splash page from builder', () {
      final widget = appPageSplashBuilder();
      expect(widget, isNotNull);
    });

    test('updateCurrentRouteEvent should run without exceptions', () {
      expect(() => appUpdateCurrentRouteEvent(CatRoutes.splash), returnsNormally);
    });
  });
}
