import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key, this.color, this.size = 24.0});

  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    final defaultColor = colorRoles?.primary ?? Colors.black;

    return Icon(icon, color: color ?? defaultColor, size: size);
  }
}
