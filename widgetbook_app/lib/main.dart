import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ui_kit/ui_kit.dart';

// Import generated file
import 'main.directories.g.dart';
import 'home_page.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Custom home page
      home: const WidgetbookHomePage(),

      // Use the generated directories variable
      directories: directories,

      // Add-ons for different configurations
      addons: [
        // Viewport add-on for responsive preview (must be first)
        ViewportAddon([
          Viewports.none,
          IosViewports.iPhone13,
          AndroidViewports.samsungGalaxyS20,
          IosViewports.iPad,
        ]),

        // Theme add-on with Light and Dark themes
        MaterialThemeAddon(
          initialTheme: WidgetbookTheme(
            name: 'Dark',
            data: PragmaTheme.darkTheme,
          ),
          themes: [
            WidgetbookTheme(
              name: 'Dark',
              data: PragmaTheme.darkTheme,
            ),
            WidgetbookTheme(
              name: 'Light',
              data: PragmaTheme.lightTheme,
            ),
          ],
        ),

        // Text scale add-on for accessibility
        TextScaleAddon(
          min: 1.0,
          max: 2.0,
        ),

        // Locale add-on for internationalization (optional)
        LocalizationAddon(
          locales: [
            const Locale('en', 'US'),
            const Locale('es', 'ES'),
          ],
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
        ),
      ],

      // App builder to wrap widgets with theme
      appBuilder: (context, child) {
        return UIkitConfigProvider(
          designWidth: 393,
          designHeight: 852,
          child: child,
        );
      },
    );
  }
}
