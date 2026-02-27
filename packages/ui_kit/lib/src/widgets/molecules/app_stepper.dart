import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<Widget> steps;
  final String title;
  final VoidCallback? onBack;

  const AppStepper({required this.currentStep, required this.totalSteps, required this.steps, required this.title, this.onBack, super.key})
    : assert(steps.length == totalSteps);

  @override
  Widget build(BuildContext context) {
    final colorRoles = Theme.of(context).extension<ColorRoles>();

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (onBack != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: colorRoles?.primary, size: 20),
                    onPressed: onBack,
                  ),
                ),
              AppText(title, color: colorRoles?.primary),
            ],
          ),
        ),

        // Progress Indicators
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalSteps, (index) {
              final isActive = index <= currentStep;
              return SizedBox(
                width: 45,
                child: Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isActive ? colorRoles?.secondary : colorRoles?.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 25),
        // Body with Animation
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: KeyedSubtree(key: ValueKey<int>(currentStep), child: steps[currentStep]),
          ),
        ),
      ],
    );
  }
}
