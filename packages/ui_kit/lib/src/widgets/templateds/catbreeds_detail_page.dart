import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CatbreedsDetailPage<T> extends StatelessWidget {
  const CatbreedsDetailPage({
    required this.item,
    required this.nameExtractor,
    required this.imageUrlExtractor,
    required this.originExtractor,
    required this.intelligenceExtractor,
    required this.isFavoriteExtractor,
    required this.descriptionExtractor,
    required this.adaptabilityExtractor,
    required this.lifeSpanExtractor,
    required this.backgroundType,
    this.affectionLevelExtractor,
    this.childFriendlyExtractor,
    this.dogFriendlyExtractor,
    this.energyLevelExtractor,
    this.groomingExtractor,
    this.temperamentExtractor,
    this.onBack,
    this.onToggleFavorite,
    super.key,
  });

  final T item;
  final String Function(T) nameExtractor;
  final String Function(T) imageUrlExtractor;
  final String Function(T) originExtractor;
  final int Function(T) intelligenceExtractor;
  final bool Function(T) isFavoriteExtractor;
  final String Function(T) descriptionExtractor;
  final int Function(T) adaptabilityExtractor;
  final String Function(T) lifeSpanExtractor;
  final int Function(T)? affectionLevelExtractor;
  final int Function(T)? childFriendlyExtractor;
  final int Function(T)? dogFriendlyExtractor;
  final int Function(T)? energyLevelExtractor;
  final int Function(T)? groomingExtractor;
  final String Function(T)? temperamentExtractor;

  final AppBackgroundType backgroundType;
  final VoidCallback? onBack;
  final ValueChanged<bool>? onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final colorRoles = context.colorRoles;
    final temperament = temperamentExtractor?.call(item) ?? '';
    final temperamentList = temperament.isNotEmpty ? temperament.split(',').map((e) => e.trim()).toList() : <String>[];

    return AppBasePage(
      type: backgroundType,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage.network(imageUrlExtractor(item), fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [colorRoles.scrim.withValues(alpha: 0.7), Colors.transparent, colorRoles.scrim.withValues(alpha: 0.8)],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 24,
                        right: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppTag(label: originExtractor(item).toUpperCase()),
                                const SizedBox(width: 8),
                                AppTag(label: 'NIVEL ${intelligenceExtractor(item)}', style: AppTagStyle.secondary),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: AppIcon(Icons.arrow_back_ios_new, color: colorRoles.onSurface, size: 20),
                        onPressed: onBack,
                      ),
                      Expanded(
                        child: AppText(
                          nameExtractor(item),
                          variant: AppTextStyle.h4,
                          color: colorRoles.onSurface,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _FavoriteToggleAction(
                        initialFavoriteActive: isFavoriteExtractor(item),
                        onToggleFavorite: onToggleFavorite,
                        colorRoles: colorRoles,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [
                      const SizedBox(height: 24),
                      // Personality Tags
                      if (temperamentList.isNotEmpty) ...[
                        AppText('PERSONALIDAD', variant: AppTextStyle.caption, color: colorRoles.secondary, fontWeight: FontWeight.bold),
                        const SizedBox(height: 12),
                        Wrap(spacing: 8, runSpacing: 12, children: temperamentList.map((tag) => AppTag(label: tag)).toList()),
                        const SizedBox(height: 32),
                      ],
                      // Description
                      AppText(descriptionExtractor(item), variant: AppTextStyle.body1, color: colorRoles.onSurfaceVariant),
                      const SizedBox(height: 32),
                      // Attributes
                      if (affectionLevelExtractor != null) ...[
                        AppAttributeCard(label: 'NIVEL DE AFECTO', value: '${affectionLevelExtractor!(item)}/5', icon: Icons.favorite),
                        const SizedBox(height: 16),
                      ],
                      AppAttributeCard(label: 'ADAPTABILIDAD', value: '${adaptabilityExtractor(item)}/5', icon: Icons.autorenew),
                      const SizedBox(height: 16),
                      if (childFriendlyExtractor != null) ...[
                        AppAttributeCard(label: 'AMIGABLE CON NIÑOS', value: '${childFriendlyExtractor!(item)}/5', icon: Icons.child_care),
                        const SizedBox(height: 16),
                      ],
                      if (dogFriendlyExtractor != null) ...[
                        AppAttributeCard(label: 'AMIGABLE CON PERROS', value: '${dogFriendlyExtractor!(item)}/5', icon: Icons.pets),
                        const SizedBox(height: 16),
                      ],
                      if (energyLevelExtractor != null) ...[
                        AppAttributeCard(label: 'NIVEL DE ENERGÍA', value: '${energyLevelExtractor!(item)}/5', icon: Icons.bolt),
                        const SizedBox(height: 16),
                      ],
                      if (groomingExtractor != null) ...[
                        AppAttributeCard(label: 'CUIDADO/ASEO', value: '${groomingExtractor!(item)}/5', icon: Icons.cleaning_services),
                        const SizedBox(height: 16),
                      ],
                      AppAttributeCard(label: 'VIDA PROMEDIO', value: lifeSpanExtractor(item), icon: Icons.info_outline),
                      const SizedBox(height: 48), // Bottom padding
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteToggleAction extends StatefulWidget {
  const _FavoriteToggleAction({required this.initialFavoriteActive, required this.colorRoles, this.onToggleFavorite});

  final bool initialFavoriteActive;
  final ColorRoles colorRoles;
  final ValueChanged<bool>? onToggleFavorite;

  @override
  State<_FavoriteToggleAction> createState() => _FavoriteToggleActionState();
}

class _FavoriteToggleActionState extends State<_FavoriteToggleAction> {
  late final ValueNotifier<bool> _isFavoriteActiveNotifier;

  @override
  void initState() {
    super.initState();
    _isFavoriteActiveNotifier = ValueNotifier<bool>(widget.initialFavoriteActive);
  }

  @override
  void dispose() {
    _isFavoriteActiveNotifier.dispose();
    super.dispose();
  }

  void _handleToggleFavorite() {
    _isFavoriteActiveNotifier.value = !_isFavoriteActiveNotifier.value;
    widget.onToggleFavorite?.call(_isFavoriteActiveNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isFavoriteActiveNotifier,
      builder: (context, isActive, _) {
        return IconButton(
          icon: AppIcon(
            isActive ? Icons.favorite : Icons.favorite_border,
            color: isActive ? widget.colorRoles.primary : widget.colorRoles.onSurface,
          ),
          onPressed: _handleToggleFavorite,
        );
      },
    );
  }
}
