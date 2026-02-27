import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Tarjeta de aviso de pago próximo.
///
/// Muestra los días restantes para el vencimiento, la fecha límite,
/// el balance de la cuota y el pago mínimo.
class PaymentNoticeCard extends StatelessWidget {
  const PaymentNoticeCard({
    required this.daysToDueDate,
    required this.dueDate,
    required this.balanceAmount,
    required this.minPaymentAmount,
    super.key,
  });

  final int daysToDueDate;
  final String dueDate;
  final String balanceAmount;
  final String minPaymentAmount;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    final white = colorRoles?.white ?? Colors.white;

    return AppCard(
      useGradient: true,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                'PAGO VENCE EN $daysToDueDate DÍAS',
                variant: AppTextStyle.h4,
                color: white,
              ),
              AppText(
                'Vence: $dueDate',
                variant: AppTextStyle.caption,
                color: white.withValues(alpha: 0.9),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
            color: colorRoles?.secondary,
            // thickness: 1,
          ),
          const SizedBox(height: 16),

          // Details Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Balance Cuota mensual',
                    variant: AppTextStyle.caption,
                    color: white,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    '\$$balanceAmount',
                    variant: AppTextStyle.numberS,
                    color: white,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: AppText(
                  'Pago Mínimo Cuota: \$$minPaymentAmount',
                  variant: AppTextStyle.caption,
                  color: white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
