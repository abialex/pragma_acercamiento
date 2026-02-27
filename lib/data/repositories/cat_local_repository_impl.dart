import 'package:fpdart/fpdart.dart';
import 'package:local_storage_manager/local_storage_manager.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/cat_breed.dart';
import '../../domain/repositories/i_cat_local_repository.dart';
import '../local/entities/cat_favorite_table.dart';
import '../local/mappers/cat_favorite_mappers.dart';

/// Local implementation of ICatLocalRepository
///
/// Handles persistence of favorites using local storage only.
class CatLocalRepositoryImpl implements ICatLocalRepository {
  final ILocalStorage localStorage;

  const CatLocalRepositoryImpl(this.localStorage);

  @override
  Future<Either<FailureApp, List<CatBreed>>> getFavorites() async {
    try {
      final favoriteTables = await localStorage.getAll<CatFavoriteTable>();
      return right(favoriteTables.toEntityList());
    } catch (e) {
      return left(FailureLocal(error: 'Failed to get favorites: $e'));
    }
  }

  @override
  Future<Either<FailureApp, void>> addFavorite(CatBreed breed) async {
    try {
      final existsResult = await isFavorite(breed.breedId);

      return await existsResult.match((failure) async => left(failure), (isFav) async {
        if (isFav) {
          return right(null);
        }
        final table = breed.toTable();
        await localStorage.save(table);
        return right(null);
      });
    } catch (e) {
      return left(FailureLocal(error: 'Failed to add favorite: $e'));
    }
  }

  @override
  Future<Either<FailureApp, void>> removeFavorite(String breedId) async {
    try {
      final removed = await localStorage.removeByCondition<CatFavoriteTable>((cat) => cat.breedId == breedId);

      if (removed == 0) {
        return left(FailureLocal(error: 'Favorite with breedId $breedId not found'));
      }
      return right(null);
    } catch (e) {
      return left(FailureLocal(error: 'Failed to remove favorite: $e'));
    }
  }

  @override
  Future<Either<FailureApp, bool>> isFavorite(String breedId) async {
    try {
      final favorites = await localStorage.getAll<CatFavoriteTable>();
      return right(favorites.any((f) => f.breedId == breedId));
    } catch (e) {
      return left(FailureLocal(error: 'Failed to check if favorite: $e'));
    }
  }

  @override
  Future<Either<FailureApp, void>> toggleFavorite(CatBreed breed) async {
    try {
      final isFavResult = await isFavorite(breed.breedId);
      return await isFavResult.match((failure) async => left(failure), (isFav) async {
        if (isFav) {
          return await removeFavorite(breed.breedId);
        } else {
          return await addFavorite(breed);
        }
      });
    } catch (e) {
      return left(FailureLocal(error: 'Failed to toggle favorite: $e'));
    }
  }

  @override
  Stream<Either<FailureApp, List<CatBreed>>> watchFavorites() {
    try {
      return localStorage.watchAll<CatFavoriteTable>().map((tables) {
        return right(tables.toEntityList());
      });
    } catch (e) {
      return Stream.value(left(FailureLocal(error: 'Failed to watch favorites: $e')));
    }
  }

  @override
  Future<Either<FailureApp, void>> clearAllFavorites() async {
    try {
      await localStorage.removeAll<CatFavoriteTable>();
      return right(null);
    } catch (e) {
      return left(FailureLocal(error: 'Failed to clear all favorites: $e'));
    }
  }
}
