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
  final String Function(T)? temperamentExtractor;

  final AppBackgroundType backgroundType;
  final VoidCallback? onBack;
  final ValueChanged<bool>? onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final temperament = temperamentExtractor?.call(item) ?? '';
    final temperamentList = temperament.isNotEmpty ? temperament.split(',').map((e) => e.trim()).toList() : <String>[];

    return AppBasePage(
      type: backgroundType,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 300,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const AppIcon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
              onPressed: onBack,
            ),
            title: AppText(nameExtractor(item), variant: AppTextStyle.h2, color: Colors.white, fontWeight: FontWeight.bold),
            centerTitle: true,
            actions: [
              _FavoriteToggleAction(initialFavoriteActive: isFavoriteExtractor(item), onToggleFavorite: onToggleFavorite),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage.network(imageUrlExtractor(item), fit: BoxFit.cover),
                  // Gradient overlay to ensure text/icons are visible
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withOpacity(0.7), Colors.transparent, Colors.black.withOpacity(0.8)],
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
                        AppText(nameExtractor(item), variant: AppTextStyle.h1, color: Colors.white, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personality Tags
                  if (temperamentList.isNotEmpty) ...[
                    const AppText('PERSONALIDAD', variant: AppTextStyle.caption, color: Colors.indigoAccent, fontWeight: FontWeight.bold),
                    const SizedBox(height: 12),
                    Wrap(spacing: 8, runSpacing: 12, children: temperamentList.map((tag) => AppTag(label: tag)).toList()),
                    const SizedBox(height: 32),
                  ],
                  // Description
                  AppText(descriptionExtractor(item), variant: AppTextStyle.body1, color: Colors.white70),
                  const SizedBox(height: 32),
                  // Attributes
                  AppAttributeCard(label: 'ADAPTABILIDAD', value: '${adaptabilityExtractor(item)}/5', icon: Icons.favorite_border),
                  const SizedBox(height: 16),
                  AppAttributeCard(label: 'VIDA PROMEDIO', value: lifeSpanExtractor(item), icon: Icons.info_outline),
                  // Add more attributes as needed based on the design
                  const SizedBox(height: 48), // Bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteToggleAction extends StatefulWidget {
  const _FavoriteToggleAction({required this.initialFavoriteActive, this.onToggleFavorite});

  final bool initialFavoriteActive;
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
          icon: AppIcon(isActive ? Icons.favorite : Icons.favorite_border, color: isActive ? Colors.deepPurpleAccent : Colors.white),
          onPressed: _handleToggleFavorite,
        );
      },
    );
  }
}
