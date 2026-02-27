import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? imagePath;

  const AppBackButton({super.key, this.onTap, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Image.asset(
        imagePath ?? '',
        package: 'ui_kit',
        // fit: BoxFit.contain,
        // color: colorRoles?.primary,
      ),
    );
  }
}
