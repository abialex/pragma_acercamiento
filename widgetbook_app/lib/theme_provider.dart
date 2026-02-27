import 'package:flutter/material.dart';

/// InheritedWidget para manejar el tema actual de Widgetbook
class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required this.themeData,
    required super.child,
  });

  final ThemeData themeData;

  static ThemeData of(BuildContext context) {
    final ThemeProvider? result =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!.themeData;
  }

  static ThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeProvider>()
        ?.themeData;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return themeData != oldWidget.themeData;
  }
}
