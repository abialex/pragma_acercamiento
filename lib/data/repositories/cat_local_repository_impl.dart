import 'package:local_storage_manager/local_storage_manager.dart';

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
  Future<List<CatBreed>> getFavorites() async {
    try {
      final favoriteTables = await localStorage.getAll<CatFavoriteTable>();
      return favoriteTables.toEntityList();
    } catch (e) {
      throw Exception('Failed to get favorites: $e');
    }
  }

  @override
  Future<void> addFavorite(CatBreed breed) async {
    try {
      final exists = await isFavorite(breed.breedId);
      if (exists) {
        return;
      }

      final table = breed.toTable();
      await localStorage.save(table);
    } catch (e) {
      throw Exception('Failed to add favorite: $e');
    }
  }

  @override
  Future<void> removeFavorite(String breedId) async {
    try {
      final removed = await localStorage.removeByCondition<CatFavoriteTable>(
        (cat) => cat.breedId == breedId,
      );

      if (removed == 0) {
        throw Exception('Favorite with breedId $breedId not found');
      }
    } catch (e) {
      throw Exception('Failed to remove favorite: $e');
    }
  }

  @override
  Future<bool> isFavorite(String breedId) async {
    try {
      final favorites = await localStorage.getAll<CatFavoriteTable>();
      return favorites.any((f) => f.breedId == breedId);
    } catch (e) {
      throw Exception('Failed to check if favorite: $e');
    }
  }

  @override
  Future<void> toggleFavorite(CatBreed breed) async {
    try {
      final isFav = await isFavorite(breed.breedId);
      if (isFav) {
        await removeFavorite(breed.breedId);
      } else {
        await addFavorite(breed);
      }
    } catch (e) {
      throw Exception('Failed to toggle favorite: $e');
    }
  }

  @override
  Stream<List<CatBreed>> watchFavorites() {
    try {
      return localStorage.watchAll<CatFavoriteTable>().map((tables) {
        return tables.toEntityList();
      });
    } catch (e) {
      throw Exception('Failed to watch favorites: $e');
    }
  }

  @override
  Future<void> clearAllFavorites() async {
    try {
      await localStorage.removeAll<CatFavoriteTable>();
    } catch (e) {
      throw Exception('Failed to clear all favorites: $e');
    }
  }
}
