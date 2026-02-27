import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import '../../../data/models/cat_filter_model.dart';
import '../../../domain/repositories/cat_repository.dart';
import '../../../domain/repositories/i_cat_local_repository.dart';
import '../../../core/error/failures.dart';
import 'cat_list_state.dart';

class CatListCubit extends Cubit<CatListState> {
  final CatRepository _repository;
  final ICatLocalRepository _localRepository;

  CatListCubit(this._repository, this._localRepository) : super(const CatListState());

  Future<Either<FailureApp, List<CatBreed>>> getList({CatFilterModel? filter}) async {
    if (state.isLoading) return right(state.catsList);

    emit(state.copyWith(isLoading: true));

    try {
      final isFirstPage = (filter?.page ?? 0) == 0;

      if (state.isFavoritesMode) {
        if (!isFirstPage) {
          emit(state.copyWith(isLoading: false));
          return right(state.catsList);
        }

        final localFavoritesResult = await _localRepository.getFavorites();
        return localFavoritesResult.match(
          (failure) {
            emit(state.copyWith(isLoading: false));
            return left(failure);
          },
          (localFavorites) {
            final mappedCats = localFavorites.map((cat) => cat.copyWith(isFavorite: true)).toList();

            final searchQuery = filter?.search?.toLowerCase();
            final filteredCats = searchQuery != null && searchQuery.isNotEmpty
                ? mappedCats.where((c) => c.name.toLowerCase().contains(searchQuery)).toList()
                : mappedCats;

            emit(state.copyWith(isLoading: false, catsList: filteredCats));
            return right(filteredCats);
          },
        );
      }

      final newCatsResult = await _repository.getBreeds(filter: filter);
      return await newCatsResult.match(
        (failure) async {
          emit(state.copyWith(isLoading: false));
          return left(failure);
        },
        (newCats) async {
          final localFavoritesResult = await _localRepository.getFavorites();
          return localFavoritesResult.match(
            (failure) {
              final resultCats = isFirstPage ? newCats : [...state.catsList, ...newCats];
              emit(state.copyWith(isLoading: false, catsList: resultCats));
              // Fallback to remote data without favorites logic if local fails
              return right(resultCats);
            },
            (localFavorites) {
              final favoriteIds = localFavorites.map((f) => f.breedId).toSet();
              final mappedCats = newCats.map((cat) {
                return cat.copyWith(isFavorite: favoriteIds.contains(cat.breedId));
              }).toList();

              final resultCats = isFirstPage ? mappedCats : [...state.catsList, ...mappedCats];
              emit(state.copyWith(isLoading: false, catsList: resultCats));
              return right(resultCats);
            },
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      return left(FailureLocal(error: 'Unexpected error: $e'));
    }
  }

  Future<Either<FailureApp, List<CatBreed>>> toggleFavoritesMode(bool isFavoritesMode, {CatFilterModel? filter}) async {
    emit(state.copyWith(isFavoritesMode: isFavoritesMode));
    return await getList(filter: filter);
  }

  Future<Either<FailureApp, Unit>> toggleFavorite(String breedId) async {
    try {
      final index = state.catsList.indexWhere((c) => c.breedId == breedId);
      if (index == -1) return right(unit);

      final cat = state.catsList[index];
      final newFavoriteStatus = !cat.isFavorite;

      if (newFavoriteStatus) {
        final result = await _localRepository.addFavorite(cat.copyWith(isFavorite: true));
        return result.match((failure) => left(failure), (_) {
          _updateListAfterToggle(index, cat, newFavoriteStatus);
          return right(unit);
        });
      } else {
        final result = await _localRepository.removeFavorite(cat.breedId);
        return result.match((failure) => left(failure), (_) {
          _updateListAfterToggle(index, cat, newFavoriteStatus);
          return right(unit);
        });
      }
    } catch (e) {
      return left(FailureLocal(error: 'Unexpected error toggling favorite: $e'));
    }
  }

  void _updateListAfterToggle(int index, CatBreed cat, bool newFavoriteStatus) {
    final updatedList = List.of(state.catsList);

    if (state.isFavoritesMode && !newFavoriteStatus) {
      updatedList.removeAt(index);
    } else {
      updatedList[index] = cat.copyWith(isFavorite: newFavoriteStatus);
    }

    emit(state.copyWith(catsList: updatedList));
  }
}
