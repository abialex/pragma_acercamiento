import 'package:flutter/material.dart';
import 'core/di/injection_container.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.setFlavor(flavor: Flavor.prod, apiBaseUrl: 'https://api.pragma.com', appName: 'Pragma', isProduction: true);

  // Initialize all dependencies
  final di = InjectionContainer();
  await di.init();
  await di.completeObjectBoxInitialization();

  runApp(const MyApp());
}
