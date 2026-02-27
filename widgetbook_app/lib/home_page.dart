import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class WidgetbookHomePage extends StatelessWidget {
  const WidgetbookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      type: AppBackgroundType.type7,
      body: UIkitConfigProvider(
        designWidth: 393,
        designHeight: 852,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                ColorPrimitives.neutral50.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Pragma
                  const AppImage.asset(
                    AppAssets.defaultPlaceholder,
                    width: 180,
                  ),
                  const SizedBox(height: 48),

                  // Título solicitado por el usuario
                  const AppText(
                    'Componentes y Themes Pragma',
                    variant: AppTextStyle.h2,
                    color: ColorPrimitives.orangePrimary500,
                    textAlign: TextAlign.center,
                    height: 1,
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const AppText(
                      'Catálogo oficial de componentes de UI y guía de estilos para el ecosistema Pragma 2026.',
                      variant: AppTextStyle.body1,
                      textAlign: TextAlign.center,
                      color: ColorPrimitives.neutral700,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Sección de Instrucciones
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const AppText(
                          'Guía de uso rápido',
                          variant: AppTextStyle.h4,
                          color: ColorPrimitives.neutral900,
                        ),
                        const SizedBox(height: 24),
                        _buildInstructionItem(
                          context,
                          Icons.explore_outlined,
                          'Navegación',
                          'Usa el panel de la izquierda (o pestaña inferior) para explorar los componentes del UI Kit.',
                        ),
                        const SizedBox(height: 16),
                        _buildInstructionItem(
                          context,
                          Icons.tune_outlined,
                          'Knobs',
                          'Usa la pestaña de Knobs para interactuar con los componentes y cambiar sus parámetros en vivo.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorPrimitives.neutral50),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorPrimitives.orangePrimary50.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: ColorPrimitives.orangePrimary500, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  variant: AppTextStyle.body1,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                AppText(
                  description,
                  variant: AppTextStyle.caption,
                  color: ColorPrimitives.neutral600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
