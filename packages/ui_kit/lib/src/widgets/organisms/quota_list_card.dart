import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Modelo de datos para un ítem de la lista de cuotas.
class QuotaListItemModel {
  const QuotaListItemModel({required this.title, required this.date, required this.amount});

  final String title;
  final String date;
  final String amount;
}

/// Un organismo que muestra una lista de cuotas dentro de una tarjeta con un pie de página.
class QuotaListCard extends StatelessWidget {
  const QuotaListCard({
    required this.items,
    this.viewAllLabel = 'Ver Todos',
    this.onViewAllPressed,
    this.emptyMessage = 'No hay cuotas registradas.',
    super.key,
  });

  /// Lista de cuotas a mostrar.
  final List<QuotaListItemModel> items;

  /// Etiqueta para el botón inferior de "Ver Todos".
  final String viewAllLabel;

  /// Acción al presionar "Ver Todos".
  final VoidCallback? onViewAllPressed;

  /// Mensaje para el estado vacío.
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _buildEmptyState();
    }

    final colorRoles = Theme.of(context).extension<ColorRoles>();
    final darkColor = colorRoles?.onSurface ?? const Color(0xFF091F2C);

    return AppCard(
      useGradient: false,
      padding: EdgeInsets.zero, // Manejamos el padding internamente para el footer
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // List Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(height: 1, thickness: 1, color: Color(0xFFF3F1EF)),
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            item.title.toUpperCase(),
                            variant: AppTextStyle.caption,
                            opacity: 0.5,
                            // color: darkColor,
                          ),
                          const SizedBox(height: 4),
                          AppText(item.date, variant: AppTextStyle.caption, opacity: 0.5),
                        ],
                      ),
                      AppText('\$${item.amount}', variant: AppTextStyle.caption, color: darkColor),
                    ],
                  ),
                );
              },
            ),
          ),

          // Footer Section
          if (onViewAllPressed != null)
            InkWell(
              onTap: onViewAllPressed,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F1EF), // Color de fondo del footer según imagen
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: AppText(
                  viewAllLabel,
                  textAlign: TextAlign.center,
                  variant: AppTextStyle.buttonLink,
                  opacity: 0.5,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return AppCard(
      useGradient: false,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppIcon(Icons.receipt_long_rounded, size: 48, color: Color(0xFFAEA49C)),
          const SizedBox(height: 16),
          AppText(emptyMessage, textAlign: TextAlign.center, variant: AppTextStyle.body1, color: const Color(0xFF091F2C)),
        ],
      ),
    );
  }
}
