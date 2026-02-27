import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({
    required this.value,
    required this.onChanged,
    this.label,
    this.labelText,
    this.variant = AppTextStyle.caption,
    this.color,
    this.activeBackgroundColor,
    super.key,
  });

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget? label;
  final String? labelText;
  final AppTextStyle variant;
  final Color? color;
  final Color? activeBackgroundColor;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool _isHovered = false;
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(AppCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        _currentValue = widget.value;
      });
    }
  }

  void _handleToggle() {
    setState(() {
      _currentValue = !_currentValue;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_currentValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();
    if (colorRoles == null) {
      throw Exception('ColorRoles not found');
    }

    final checkbox = Checkbox(
      value: _currentValue,
      onChanged: (_) => _handleToggle(),
      activeColor: widget.activeBackgroundColor ?? colorRoles.onSurface,
      checkColor: Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      splashRadius: 0,
      side: BorderSide(
        color: _isHovered ? colorRoles.onSurface : colorRoles.outline,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return colorRoles.primary.withAlpha(25);
          }
          return null;
        },
      ),
    );

    if (widget.label == null && widget.labelText == null) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: checkbox,
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _handleToggle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            checkbox,
            Flexible(
              child: widget.label ??
                  AppText(
                    widget.labelText ?? '',
                    variant: widget.variant,
                    color: widget.color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
