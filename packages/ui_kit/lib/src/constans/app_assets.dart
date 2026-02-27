/// Clase para gestionar las rutas de los assets del kit de UI.
///
/// IMPORTANTE: Al usar assets desde este package en una aplicación externa,
/// se debe especificar el parámetro `package: AppAssets.packageName`.
class AppAssets {
  AppAssets._();

  /// Nombre del package para ser usado en SvgPicture.asset o Image.asset
  static const String packageName = 'ui_kit';

  /// Ruta base de los iconos
  static const String _iconsPath = 'assets/icons';

  static const String defaultPlaceholder = '$_iconsPath/default-placeholder.png';
}
