import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppErrorDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onOkPressed;
  final String okLabel;

  const AppErrorDialog({required this.title, required this.body, this.onOkPressed, this.okLabel = 'OK', super.key});

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget body,
    VoidCallback? onOkPressed,
    String okLabel = 'OK',
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppErrorDialog(title: title, body: body, onOkPressed: onOkPressed, okLabel: okLabel),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return Dialog(
      backgroundColor: colorRoles?.surfaceContainer ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            AppText(
              title,
              variant: AppTextStyle.h3,
              color: colorRoles?.onSurface,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            // Body
            DefaultTextStyle(
              style: TextStyle(color: colorRoles?.onSurfaceVariant, fontSize: 16),
              textAlign: TextAlign.center,
              child: body,
            ),
            const SizedBox(height: 24),
            // OK Button
            AppButton(
              label: okLabel,
              style: AppButtonStyle.primary, // Default to primary as requested
              isFullWidth: true,
              onPressed: () {
                if (onOkPressed != null) {
                  onOkPressed!();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
