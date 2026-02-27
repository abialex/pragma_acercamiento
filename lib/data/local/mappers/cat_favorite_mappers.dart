import '../../../domain/entities/cat_breed.dart';
import '../entities/cat_favorite_table.dart';

/// Extension to convert from Domain Entity to Table Entity
extension CatBreedToTable on CatBreed {
  /// Converts a CatBreed domain entity to a CatFavoriteTable for persistence
  CatFavoriteTable toTable() {
    return CatFavoriteTable(
      breedId: breedId,
      name: name,
      origin: origin,
      intelligence: intelligence,
      imageUrl: imageUrl,
      nameLowerCase: name.toLowerCase(),
    );
  }
}

/// Extension to convert from Table Entity to Domain Entity
extension CatFavoriteTableToEntity on CatFavoriteTable {
  /// Converts a CatFavoriteTable to a CatBreed domain entity
  CatBreed toEntity() {
    return CatBreed(
      breedId: breedId,
      name: name,
      origin: origin,
      intelligence: intelligence,
      imageUrl: imageUrl,
      isFavorite: true, // If it's in favorites table, it's a favorite
    );
  }
}

/// Extension for lists
extension CatFavoriteTableListToEntity on List<CatFavoriteTable> {
  /// Converts a list of CatFavoriteTable to a list of CatBreed entities
  List<CatBreed> toEntityList() {
    return map((table) => table.toEntity()).toList();
  }
}

/// Extension for lists
extension CatBreedListToTable on List<CatBreed> {
  /// Converts a list of CatBreed entities to a list of CatFavoriteTable
  List<CatFavoriteTable> toTableList() {
    return map((entity) => entity.toTable()).toList();
  }
}
