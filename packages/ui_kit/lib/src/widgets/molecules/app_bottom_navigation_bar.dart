import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppBottomNavItem {
  final String label;
  final Widget icon;
  final Widget activeIcon;

  const AppBottomNavItem({required this.label, required this.icon, Widget? activeIcon}) : activeIcon = activeIcon ?? icon;
}

class AppBottomNavigationBar extends StatelessWidget {
  final List<AppBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({required this.items, required this.currentIndex, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return Container(
      decoration: BoxDecoration(
        color: colorRoles?.surfaceContainer ?? ColorPrimitives.neutral50,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isSelected = currentIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: _BottomNavItemWidget(item: items[index], isSelected: isSelected, colorRoles: colorRoles),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavItemWidget extends StatelessWidget {
  final AppBottomNavItem item;
  final bool isSelected;
  final ColorRoles? colorRoles;

  const _BottomNavItemWidget({required this.item, required this.isSelected, this.colorRoles});

  @override
  Widget build(BuildContext context) {
    final activeColor = colorRoles?.primary ?? Colors.orange;
    const inactiveColor = Colors.white;
    const activeContentColor = Colors.white;
    final inactiveContentColor = colorRoles?.onSurface ?? const Color(0xFF0D1B2A);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(color: isSelected ? activeColor : inactiveColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: KeyedSubtree(
              key: ValueKey(isSelected),
              child: IconTheme(
                data: IconThemeData(color: isSelected ? activeContentColor : inactiveContentColor, size: 24),
                child: isSelected ? item.activeIcon : item.icon,
              ),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: isSelected ? activeContentColor : inactiveContentColor,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            ),
            child: AppText(item.label, variant: AppTextStyle.buttonCaption, color: isSelected ? activeContentColor : inactiveContentColor),
          ),
        ],
      ),
    );
  }
}
