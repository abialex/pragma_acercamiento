import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CatbreedsListPage<T> extends StatefulWidget {
  const CatbreedsListPage({
    required this.items,
    required this.nameExtractor,
    required this.imageUrlExtractor,
    required this.originExtractor,
    required this.intelligenceExtractor,
    required this.isFavoriteExtractor,
    required this.backgroundType,
    this.initialFavoriteActive = false,
    this.isLoading = false,
    this.onToggleFavorite,
    this.onSearchChanged,
    this.onCatFavoriteTap,
    this.onCatTap,
    this.onLoadMore,
    super.key,
  });

  final List<T> items;
  final String Function(T item) nameExtractor;
  final String Function(T item) imageUrlExtractor;
  final String Function(T item) originExtractor;
  final int Function(T item) intelligenceExtractor;
  final bool Function(T item) isFavoriteExtractor;

  final AppBackgroundType backgroundType;
  final bool initialFavoriteActive;
  final bool isLoading;
  final ValueChanged<bool>? onToggleFavorite;
  final ValueChanged<String>? onSearchChanged;
  final Function(T item)? onCatFavoriteTap;
  final Function(T item)? onCatTap;
  final VoidCallback? onLoadMore;

  @override
  State<CatbreedsListPage<T>> createState() => _CatbreedsListPageState<T>();
}

class _CatbreedsListPageState<T> extends State<CatbreedsListPage<T>> {
  late final ValueNotifier<bool> _isFavoriteActiveNotifier;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _isFavoriteActiveNotifier = ValueNotifier<bool>(widget.initialFavoriteActive);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _isFavoriteActiveNotifier.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!widget.isLoading) {
        widget.onLoadMore?.call();
      }
    }
  }

  void _handleToggleFavorite() {
    _isFavoriteActiveNotifier.value = !_isFavoriteActiveNotifier.value;
    widget.onToggleFavorite?.call(_isFavoriteActiveNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      type: widget.backgroundType,
      body: Column(
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText('Catbreeds', variant: AppTextStyle.h3, color: Colors.white, fontWeight: FontWeight.bold),
              ValueListenableBuilder<bool>(
                valueListenable: _isFavoriteActiveNotifier,
                builder: (context, isActive, _) {
                  return AppToggleFavoriteButton(isFavoriteActive: isActive, onPressed: _handleToggleFavorite);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          AppLabeledTextField(
            hintText: 'Buscar raza en inglés...',
            prefixIcon: AppIcon(Icons.search, color: Theme.of(context).extension<ColorRoles>()?.primary ?? Colors.purple, size: 20),
            onChanged: widget.onSearchChanged,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              itemCount: widget.items.length + (widget.isLoading ? 1 : 0),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                if (index == widget.items.length) {
                  return const Center(
                    child: Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator()),
                  );
                }

                final item = widget.items[index];
                return AppCatCard(
                  breedName: widget.nameExtractor(item),
                  imageUrl: widget.imageUrlExtractor(item),
                  origin: widget.originExtractor(item),
                  intelligence: widget.intelligenceExtractor(item),
                  isFavorite: widget.isFavoriteExtractor(item),
                  onFavoriteTap: () => widget.onCatFavoriteTap?.call(item),
                  onTap: () => widget.onCatTap?.call(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
