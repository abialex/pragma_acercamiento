import 'package:flutter/material.dart';

class AppTransparentDialog extends StatelessWidget {
  final Widget child;
  final bool useSafeArea;

  const AppTransparentDialog({
    required this.child,
    this.useSafeArea = true,
    super.key,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    Color barrierColor = Colors.black54,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (context) => AppTransparentDialog(
        useSafeArea: useSafeArea,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = child;

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: content,
    );
  }
}
