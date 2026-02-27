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
        // Theme add-on with Light and Dark themes
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: PragmaTheme.lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: PragmaTheme.darkTheme,
            ),
          ],
        ),

        // Device frame add-on for responsive preview
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
            Devices.ios.iPad,
          ],
        ),

        // Text scale add-on for accessibility
        TextScaleAddon(
          scales: [1.0, 1.5, 2.0],
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
