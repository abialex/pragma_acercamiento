// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:pragma_acercamiento/flavors/flavor_config.dart';
import 'package:pragma_acercamiento/flavors/flavor.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 1. Necesitamos inicializar FlavorConfig porque MyHomePage lo utiliza internamente
    FlavorConfig.setFlavor(flavor: Flavor.dev, apiBaseUrl: 'https://api.test.com', appName: 'Pragma Test', isProduction: false);
  });
}
