import 'package:flutter/material.dart';
import 'package:pragma_acercamiento/core/error/failures.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_cubit.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_state.dart';
import 'package:pragma_acercamiento/domain/models/cat_filter_model.dart';

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
    _getList();
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
            _toggleFavoritesMode(isActive);
          },
          onSearchChanged: _onSearchChanged,
          onCatFavoriteTap: (cat) {
            _toggleFavorite(cat);
          },
          onCatTap: (cat) {
            context.pushNamed(CatRoutes.detailcat.name, extra: cat);
          },
        );
      },
    );
  }

  void _toggleFavorite(CatBreed cat) async {
    final result = await context.read<CatListCubit>().toggleFavorite(cat.breedId);
    result.mapLeft((failure) {
      if (failure is FailureLocal) {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: 'Error local', body: AppText(failure.error)),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: 'Error api', body: AppText(failure.error)),
        );
      }
    });
  }

  void _toggleFavoritesMode(bool isActive) async {
    final result = await context.read<CatListCubit>().toggleFavoritesMode(
      isActive,
      filter: CatFilterModel(page: 0, limit: 10, search: _currentSearch.isNotEmpty ? _currentSearch : null),
    );
    result.mapLeft((failure) {
      if (failure is FailureLocal) {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: 'Error local', body: AppText(failure.error)),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: 'Error api', body: AppText(failure.error)),
        );
      }
    });
  }

  void _getList() async {
    final result = await context.read<CatListCubit>().getList(
      filter: CatFilterModel(page: _currentPage, limit: 10, search: _currentSearch.isNotEmpty ? _currentSearch : null),
    );
    result.mapLeft((failure) {
      if (failure is FailureLocal) {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: 'Error local', body: AppText(failure.error)),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AppErrorDialog(title: 'Error api', body: AppText(failure.error)),
        );
      }
    });
  }
}
