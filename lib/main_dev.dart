import 'package:flutter/material.dart';
import 'core/di/injection_container.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.setFlavor(
    flavor: Flavor.dev,
    apiBaseUrl: 'https://dev-api.pragma.com',
    appName: 'Pragma (DEV)',
    isProduction: false,
  );

  // Initialize all dependencies
  await InjectionContainer().init();

  runApp(const MyApp());
}
