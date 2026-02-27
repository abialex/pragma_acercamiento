import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_cubit.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_state.dart';
import 'package:pragma_acercamiento/data/models/cat_filter_model.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  int _currentPage = 0;
  String _currentSearch = '';

  @override
  void initState() {
    super.initState();
    // Iniciar con la primera carga
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchCats(isRefresh: true);
    });
  }

  void _fetchCats({bool isRefresh = false}) {
    if (isRefresh) {
      _currentPage = 0;
    }
    context.read<CatListCubit>().getList(
      filter: CatFilterModel(page: _currentPage, limit: 10, search: _currentSearch.isNotEmpty ? _currentSearch : null),
    );
  }

  void _onLoadMore() {
    _currentPage++;
    _fetchCats();
  }

  void _onSearchChanged(String query) {
    _currentSearch = query;
    _fetchCats(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatListCubit, CatListState>(
      builder: (context, state) {
        return CatbreedsListPage<CatBreed>(
          items: state.catsList,
          isLoading: state.isLoading,
          backgroundType: AppBackgroundType.darkSolid,
          nameExtractor: (cat) => cat.name,
          imageUrlExtractor: (cat) => cat.imageUrl ?? '',
          originExtractor: (cat) => cat.origin ?? 'Desconocido',
          intelligenceExtractor: (cat) => cat.intelligence ?? 0,
          isFavoriteExtractor: (cat) => cat.isFavorite,
          onLoadMore: _onLoadMore,
          onToggleFavorite: (isActive) {
            // Pasamos el filtro actual por si hay una búsqueda activa
            context.read<CatListCubit>().toggleFavoritesMode(
              isActive,
              filter: CatFilterModel(page: 0, limit: 10, search: _currentSearch.isNotEmpty ? _currentSearch : null),
            );
          },
          onSearchChanged: _onSearchChanged,
          onCatFavoriteTap: (cat) {
            context.read<CatListCubit>().toggleFavorite(cat.breedId);
          },
          onCatTap: (cat) {
            context.pushNamed(CatRoutes.detailcat.name, extra: cat);
          },
        );
      },
    );
  }
}
