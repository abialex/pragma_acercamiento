import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AsambleaCard extends StatelessWidget {
  const AsambleaCard({
    required this.asambleaNumber,
    required this.startTime,
    required this.date,
    required this.isNotificationActive,
    required this.onLivePressed,
    required this.onCalendarPressed,
    this.onNotificationToggle,
    super.key,
  });

  final String asambleaNumber;
  final String startTime;
  final String date;
  final bool isNotificationActive;
  final VoidCallback onLivePressed;
  final VoidCallback onCalendarPressed;
  final VoidCallback? onNotificationToggle;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      useGradient: true,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                'ASAMBLEA DEL DÍA',
                variant: AppTextStyle.h4,
                color: Colors.white,
              ),
              AppText(
                'Inicio en $startTime',
                variant: AppTextStyle.caption,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.white38, thickness: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Asamblea #',
                    variant: AppTextStyle.caption,
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    asambleaNumber,
                    variant: AppTextStyle.subtitle1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: AppText(
                  date,
                  variant: AppTextStyle.caption,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTag(
                    label: 'Notificación: ${isNotificationActive ? 'Activada' : 'Desactivada'}',
                    style: isNotificationActive ? AppTagStyle.primary : AppTagStyle.secondary,
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    label: 'Entra en Vivo',
                    onPressed: onLivePressed,
                    style: AppButtonStyle.secondary,
                    shape: AppButtonShape.pill,
                  ),
                ],
              ),
              AppLinkButton(
                label: 'Agregar al\nCalendario',
                onPressed: onCalendarPressed,
                color: Colors.white,
                padding: EdgeInsets.zero,
                textVariant: AppTextStyle.body2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
