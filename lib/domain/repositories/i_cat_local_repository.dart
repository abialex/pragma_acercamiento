import '../entities/cat_breed.dart';

/// Repository interface for local cat favorites operations
///
/// This defines the contract for local persistence of favorites.
abstract class ICatLocalRepository {
  /// Get all favorite breeds
  Future<List<CatBreed>> getFavorites();

  /// Add a breed to favorites
  Future<void> addFavorite(CatBreed breed);

  /// Remove a breed from favorites by breed ID
  Future<void> removeFavorite(String breedId);

  /// Check if a breed is favorite
  Future<bool> isFavorite(String breedId);

  /// Toggle favorite status
  Future<void> toggleFavorite(CatBreed breed);

  /// Watch favorites for changes (reactive)
  Stream<List<CatBreed>> watchFavorites();

  /// Clear all favorites
  Future<void> clearAllFavorites();
}
