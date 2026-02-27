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
  final String? description;
  final String? lifeSpan;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final bool isFavorite;

  const CatBreed({
    required this.breedId,
    required this.name,
    this.origin,
    this.intelligence,
    this.imageUrl,
    this.temperament,
    this.description,
    this.lifeSpan,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.isFavorite = false,
  });

  CatBreed copyWith({
    String? breedId,
    String? name,
    String? origin,
    int? intelligence,
    String? imageUrl,
    String? temperament,
    String? description,
    String? lifeSpan,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    bool? isFavorite,
  }) {
    return CatBreed(
      breedId: breedId ?? this.breedId,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      intelligence: intelligence ?? this.intelligence,
      imageUrl: imageUrl ?? this.imageUrl,
      temperament: temperament ?? this.temperament,
      description: description ?? this.description,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      grooming: grooming ?? this.grooming,
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
        other.description == description &&
        other.lifeSpan == lifeSpan &&
        other.adaptability == adaptability &&
        other.affectionLevel == affectionLevel &&
        other.childFriendly == childFriendly &&
        other.dogFriendly == dogFriendly &&
        other.energyLevel == energyLevel &&
        other.grooming == grooming &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return Object.hash(
      breedId,
      name,
      origin,
      intelligence,
      imageUrl,
      temperament,
      description,
      lifeSpan,
      adaptability,
      affectionLevel,
      childFriendly,
      dogFriendly,
      energyLevel,
      grooming,
      isFavorite,
    );
  }

  @override
  String toString() {
    return 'CatBreed(breedId: $breedId, name: $name, origin: $origin, '
        'intelligence: $intelligence, temperament: $temperament, '
        'description: $description, lifeSpan: $lifeSpan, adaptability: $adaptability, '
        'affectionLevel: $affectionLevel, childFriendly: $childFriendly, '
        'dogFriendly: $dogFriendly, energyLevel: $energyLevel, grooming: $grooming, isFavorite: $isFavorite)';
  }
}
