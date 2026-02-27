import '../../domain/entities/cat_breed.dart';

/// Remote data source interface for Cat API
///
/// This defines the contract for remote cat data operations.
abstract class ICatRemoteDataSource {
  /// Fetch all cat breeds from the API
  Future<List<CatBreed>> fetchAllBreeds();

  /// Fetch breeds by origin from the API
  Future<List<CatBreed>> fetchBreedsByOrigin(String origin);

  /// Fetch a single breed by ID from the API
  Future<CatBreed?> fetchBreedById(String breedId);

  /// Search breeds by query from the API
  Future<List<CatBreed>> searchBreeds(String query);
}
