import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppPhoneInputField extends StatelessWidget {
  const AppPhoneInputField({
    this.label,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onCountryChanged,
    this.selectedCountryCode = '+51',
    this.countries = const ['+51', '+1', '+54', '+56'],
    super.key,
  });

  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onCountryChanged;
  final String selectedCountryCode;
  final List<String> countries;

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        if (label != null)
          AppText(
            label!,
            variant: AppTextStyle.body2,
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            // Country Selector
            SizedBox(
              width: 140,
              child: AppDropdown<String>(
                value: selectedCountryCode,
                options: countries,
                itemBuilder: (code) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_getFlag(code), style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 8),
                    AppText(
                      code,
                      variant: AppTextStyle.body2,
                      color: colorRoles?.primary,
                    ),
                  ],
                ),
                onChanged: onCountryChanged,
              ),
            ),
            // Phone Number Field
            Expanded(
              child: AppTextField(
                controller: controller,
                hintText: hintText,
                keyboardType: TextInputType.phone,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getFlag(String code) {
    switch (code) {
      case '+51':
        return '🇵🇪';
      case '+1':
        return '🇺🇸';
      case '+54':
        return '🇦🇷';
      case '+56':
        return '🇨🇱';
      default:
        return '🏳️';
    }
  }
}
