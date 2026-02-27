// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pragma_acercamiento/main.dart';
import 'package:pragma_acercamiento/flavors/flavor_config.dart';
import 'package:pragma_acercamiento/flavors/flavor.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 1. Necesitamos inicializar FlavorConfig porque MyHomePage lo utiliza internamente
    FlavorConfig.setFlavor(flavor: Flavor.dev, apiBaseUrl: 'https://api.test.com', appName: 'Pragma Test', isProduction: false);

    // 2. En lugar de bombear MyApp() (que requiere todas las dependencias y enrutamiento),
    // bombeamos MyHomePage directamente dentro de un MaterialApp básico.
    await tester.pumpWidget(const MaterialApp(home: MyHomePage(title: 'Pragma Test')));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
