import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/di/injection_container.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar variables de entorno desde .env
  await dotenv.load(fileName: '.env');

  FlavorConfig.setFlavor(flavor: Flavor.uat, apiBaseUrl: 'https://uat-api.pragma.com', appName: 'Pragma (UAT)', isProduction: false);

  // Initialize all dependencies
  final di = InjectionContainer();
  await di.init();
  await di.completeObjectBoxInitialization();

  runApp(const MyApp());
}
