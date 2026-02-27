import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';
// If using go_router you might navigate to the main screen after a delay.

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Simulate initialization delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(CatRoutes.listcat.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) return const SizedBox();

    return AppBasePage(
      type: AppBackgroundType.darkSolid,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cat Icon container
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: colorRoles.primary, // violet500
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.pets, // Placeholder for the actual cat icon
                color: Colors.white,
                size: 60,
              ),
            ),
            const SizedBox(height: 24),
            // Catbreeds title
            AppText('Catbreeds', variant: AppTextStyle.h1, color: Colors.white, fontWeight: FontWeight.bold),
            const SizedBox(height: 8),
            // Subtitle
            AppText(
              'by Pragma',
              variant: AppTextStyle.body1,
              color: colorRoles.secondary, // violet600 or secondary color
            ),
          ],
        ),
      ),
    );
  }
}
