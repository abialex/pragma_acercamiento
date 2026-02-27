import 'package:fpdart/fpdart.dart';
import '../../core/error/failures.dart';
import '../entities/cat_breed.dart';

/// Repository interface for local cat favorites operations
///
/// This defines the contract for local persistence of favorites.
abstract class ICatLocalRepository {
  /// Get all favorite breeds
  Future<Either<FailureApp, List<CatBreed>>> getFavorites();

  /// Add a breed to favorites
  Future<Either<FailureApp, void>> addFavorite(CatBreed breed);

  /// Remove a breed from favorites by breed ID
  Future<Either<FailureApp, void>> removeFavorite(String breedId);

  /// Check if a breed is favorite
  Future<Either<FailureApp, bool>> isFavorite(String breedId);

  /// Toggle favorite status
  Future<Either<FailureApp, void>> toggleFavorite(CatBreed breed);

  /// Watch favorites for changes (reactive)
  Stream<Either<FailureApp, List<CatBreed>>> watchFavorites();

  /// Clear all favorites
  Future<Either<FailureApp, void>> clearAllFavorites();
}
