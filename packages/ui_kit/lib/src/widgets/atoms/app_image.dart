import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ui_kit/ui_kit.dart';

enum _AppImageType { asset, network, file }

class AppImage extends StatelessWidget {
  final String source;
  final _AppImageType type;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;

  /// --- CONFIGURACIÓN DEL MONOREPO ---
  /// Cambia esto por el nombre de tu paquete en pubspec.yaml (ej: 'ui_kit')
  static const String _uiPackageName = 'ui_kit';

  const AppImage.asset(this.source, {super.key, this.width, this.height, this.fit = BoxFit.contain, this.color, this.borderRadius = 0})
    : type = _AppImageType.asset;

  const AppImage.network(this.source, {super.key, this.width, this.height, this.fit = BoxFit.cover, this.color, this.borderRadius = 0})
    : type = _AppImageType.network;

  const AppImage.file(this.source, {super.key, this.width, this.height, this.fit = BoxFit.cover, this.color, this.borderRadius = 0})
    : type = _AppImageType.file;

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño actual de la pantalla
    final size = MediaQuery.sizeOf(context);
    final config = UIkitConfigProvider.maybeOf(context);
    // Aplicamos la "regla de 3" con respecto a las dimensiones de diseño (Figma)
    // ancho_ajustado = (ancho_diseño * ancho_pantalla_actual) / ancho_base_figma
    assert(config != null, 'UIkitConfigProvider must be initialized in the project');

    final rWidth = width != null ? (width! * size.width) / config!.designWidth : null;
    final rHeight = height != null ? (height! * size.height) / config!.designHeight : null;

    return ClipRRect(borderRadius: BorderRadius.circular(borderRadius), child: _buildContent(rWidth, rHeight));
  }

  Widget _buildContent(double? rWidth, double? rHeight) {
    final isSvg = source.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return _buildVectorImage(rWidth, rHeight);
    } else {
      return _buildRasterImage(rWidth, rHeight);
    }
  }

  Widget _buildVectorImage(double? rWidth, double? rHeight) {
    final colorFilter = color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

    switch (type) {
      case _AppImageType.network:
        return SvgPicture.network(
          source,
          width: rWidth,
          height: rHeight,
          fit: fit,
          colorFilter: colorFilter,
          placeholderBuilder: (_) => _loadingWidget(),
        );
      case _AppImageType.asset:
        return SvgPicture.asset(source, width: rWidth, height: rHeight, fit: fit, colorFilter: colorFilter, package: _uiPackageName);
      case _AppImageType.file:
        if (kIsWeb) return _errorWidget();
        return SvgPicture.file(io.File(source) as dynamic, width: rWidth, height: rHeight, fit: fit, colorFilter: colorFilter);
    }
  }

  Widget _buildRasterImage(double? rWidth, double? rHeight) {
    switch (type) {
      case _AppImageType.network:
        return CachedNetworkImage(
          imageUrl: source,
          width: rWidth,
          height: rHeight,
          fit: fit,
          placeholder: (context, url) => _loadingWidget(),
          errorWidget: (context, url, error) => _errorWidget(),
          memCacheWidth: rWidth != null && rWidth.isFinite ? rWidth.toInt() : null,
          memCacheHeight: rHeight != null && rHeight.isFinite ? rHeight.toInt() : null,
        );
      case _AppImageType.asset:
        return Image.asset(source, width: rWidth, height: rHeight, fit: fit, color: color, package: _uiPackageName);
      case _AppImageType.file:
        if (kIsWeb) return _errorWidget();
        return Image.file(io.File(source) as dynamic, width: rWidth, height: rHeight, fit: fit);
    }
  }

  Widget _loadingWidget() => const Center(child: CircularProgressIndicator(strokeWidth: 2));

  Widget _errorWidget() => Container(
    color: Colors.grey[200],
    child: const AppIcon(Icons.broken_image, color: Colors.grey),
  );
}
