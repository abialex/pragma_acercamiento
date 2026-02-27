import 'flavor.dart';

class FlavorConfig {
  static late Flavor _currentFlavor;
  static late String _apiBaseUrl;
  static late String _appName;
  static late bool _isProduction;

  static void setFlavor({
    required Flavor flavor,
    required String apiBaseUrl,
    required String appName,
    required bool isProduction,
  }) {
    _currentFlavor = flavor;
    _apiBaseUrl = apiBaseUrl;
    _appName = appName;
    _isProduction = isProduction;
  }

  static Flavor get currentFlavor => _currentFlavor;
  static String get apiBaseUrl => _apiBaseUrl;
  static String get appName => _appName;
  static bool get isProduction => _isProduction;

  static bool get isDev => _currentFlavor == Flavor.dev;
  static bool get isUat => _currentFlavor == Flavor.uat;
  static bool get isProd => _currentFlavor == Flavor.prod;
}
