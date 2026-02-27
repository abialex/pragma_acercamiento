// ui_kit/lib/src/core/ui_config_provider.dart
import 'package:flutter/widgets.dart';

class UIkitConfigProvider extends InheritedWidget {
  final double designWidth;
  final double designHeight;

  const UIkitConfigProvider({
    super.key,
    required this.designWidth,
    required this.designHeight,
    required super.child,
  });

  // Método para que cualquier átomo o molécula acceda a los datos
  static UIkitConfigProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UIkitConfigProvider>();
  }

  @override
  bool updateShouldNotify(UIkitConfigProvider oldWidget) {
    return oldWidget.designWidth != designWidth || oldWidget.designHeight != designHeight;
  }
}
