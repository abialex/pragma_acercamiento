import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cat_filter_model.dart';
import '../../../domain/repositories/cat_repository.dart';
import '../../../domain/repositories/i_cat_local_repository.dart';
import 'cat_list_state.dart';

class CatListCubit extends Cubit<CatListState> {
  final CatRepository _repository;
  final ICatLocalRepository _localRepository;

  CatListCubit(this._repository, this._localRepository) : super(const CatListState());

  Future<void> getList({CatFilterModel? filter}) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    try {
      final isFirstPage = (filter?.page ?? 0) == 0;

      if (state.isFavoritesMode) {
        // si no estamos en el primer page filtramos todos lso favoritos
        if (!isFirstPage) {
          emit(state.copyWith(isLoading: false));
          return;
        }

        final localFavorites = await _localRepository.getFavorites();
        final mappedCats = localFavorites.map((cat) => cat.copyWith(isFavorite: true)).toList();

        final searchQuery = filter?.search?.toLowerCase();
        final filteredCats = searchQuery != null && searchQuery.isNotEmpty
            ? mappedCats.where((c) => c.name.toLowerCase().contains(searchQuery)).toList()
            : mappedCats;

        emit(state.copyWith(isLoading: false, catsList: filteredCats));
        return;
      }

      final newCats = await _repository.getBreeds(filter: filter);
      final localFavorites = await _localRepository.getFavorites();
      final favoriteIds = localFavorites.map((f) => f.breedId).toSet();

      final mappedCats = newCats.map((cat) {
        return cat.copyWith(isFavorite: favoriteIds.contains(cat.breedId));
      }).toList();

      emit(state.copyWith(isLoading: false, catsList: isFirstPage ? mappedCats : [...state.catsList, ...mappedCats]));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> toggleFavoritesMode(bool isFavoritesMode, {CatFilterModel? filter}) async {
    emit(state.copyWith(isFavoritesMode: isFavoritesMode));
    // Force a fetch to either get remote data or local data, preserving current filter
    await getList(filter: filter);
  }

  Future<void> toggleFavorite(String breedId) async {
    try {
      final index = state.catsList.indexWhere((c) => c.breedId == breedId);
      if (index == -1) return;

      final cat = state.catsList[index];
      final newFavoriteStatus = !cat.isFavorite;
      // Update Local DB explicitly
      if (newFavoriteStatus) {
        await _localRepository.addFavorite(cat.copyWith(isFavorite: true));
      } else {
        await _localRepository.removeFavorite(cat.breedId);
      }
      final updatedList = List.of(state.catsList);

      if (state.isFavoritesMode && !newFavoriteStatus) {
        updatedList.removeAt(index);
      } else {
        updatedList[index] = cat.copyWith(isFavorite: newFavoriteStatus);
      }

      emit(state.copyWith(catsList: updatedList));
    } catch (e) {
      // Handle potential errors updating favorite
    }
  }
}
