import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

/// Mock implementation of StatefulNavigationShell for Widgetbook preview
class MockStatefulNavigationShell extends ValueNotifier<int> {
  final void Function(int) onTap;

  MockStatefulNavigationShell({
    required int initialIndex,
    required this.onTap,
  }) : super(initialIndex);

  int get currentIndex => value;

  void setIndex(int index) {
    value = index;
    onTap(index);
  }
}

/// MainWrapper widget that receives a navigation shell
class MainWrapper extends StatelessWidget {
  final MockStatefulNavigationShell navigationShell;
  final bool showAsambleaBadge;

  const MainWrapper({
    super.key,
    required this.navigationShell,
    required this.showAsambleaBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationShell.currentIndex,
        children: const [
          Center(child: Text('Inicio')),
          Center(child: Text('Asamblea')),
          Center(child: Text('Remate')),
          Center(child: Text('Pagos')),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: navigationShell,
        builder: (context, currentIndex, __) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: navigationShell.setIndex,
            selectedItemColor: Colors.orange,
            unselectedItemColor: const Color(0xFF1A237E), // Azul oscuro/negro
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.gavel),
                    if (showAsambleaBadge)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                label: 'Asamblea',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Remate',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                label: 'Pagos',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          );
        },
      ),
    );
  }
}

/// Widgetbook Use Case for MainWrapper
Widget mainWrapperUseCase(BuildContext context) {
  final selectedIndex = context.knobs.double.slider(label: 'Índice pestaña', initialValue: 0, min: 0, max: 3).toInt();
  final showBadge = context.knobs.boolean(label: 'Badge Asamblea', initialValue: false);

  final navigationShell = MockStatefulNavigationShell(
    initialIndex: selectedIndex,
    onTap: (_) {},
  );
  navigationShell.setIndex(selectedIndex);

  return MainWrapper(
    navigationShell: navigationShell,
    showAsambleaBadge: showBadge,
  );
}
