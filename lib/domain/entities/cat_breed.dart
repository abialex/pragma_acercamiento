/// Domain entity for Cat Breed
///
/// This represents a cat breed in the domain/business logic layer.
/// It's independent of any persistence or API implementation.
class CatBreed {
  final String breedId;
  final String name;
  final String? origin;
  final int? intelligence;
  final String? imageUrl;
  final String? temperament;
  final bool isFavorite;

  const CatBreed({
    required this.breedId,
    required this.name,
    this.origin,
    this.intelligence,
    this.imageUrl,
    this.temperament,
    this.isFavorite = false,
  });

  CatBreed copyWith({
    String? breedId,
    String? name,
    String? origin,
    int? intelligence,
    String? imageUrl,
    String? temperament,
    bool? isFavorite,
  }) {
    return CatBreed(
      breedId: breedId ?? this.breedId,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      intelligence: intelligence ?? this.intelligence,
      imageUrl: imageUrl ?? this.imageUrl,
      temperament: temperament ?? this.temperament,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CatBreed &&
        other.breedId == breedId &&
        other.name == name &&
        other.origin == origin &&
        other.intelligence == intelligence &&
        other.imageUrl == imageUrl &&
        other.temperament == temperament &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return Object.hash(breedId, name, origin, intelligence, imageUrl, temperament, isFavorite);
  }

  @override
  String toString() {
    return 'CatBreed(breedId: $breedId, name: $name, origin: $origin, '
        'intelligence: $intelligence, temperament: $temperament, isFavorite: $isFavorite)';
  }
}
