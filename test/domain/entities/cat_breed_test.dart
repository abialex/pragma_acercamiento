import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';

void main() {
  const tCatBreed = CatBreed(
    breedId: 'beng',
    name: 'Bengal',
    origin: 'United States',
    intelligence: 5,
    imageUrl: 'https://example.com/bengal.jpg',
    temperament: 'Alert, Agile, Energetic, Demanding, Intelligent',
    description: 'Bengals are a lot of fun to live with.',
    lifeSpan: '12 - 15',
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 4,
    dogFriendly: 5,
    energyLevel: 5,
    grooming: 1,
    isFavorite: false,
  );

  group('CatBreed', () {
    test('should support value equality', () {
      final tCatBreed2 = CatBreed(
        breedId: 'beng',
        name: 'Bengal',
        origin: 'United States',
        intelligence: 5,
        imageUrl: 'https://example.com/bengal.jpg',
        temperament: 'Alert, Agile, Energetic, Demanding, Intelligent',
        description: 'Bengals are a lot of fun to live with.',
        lifeSpan: '12 - 15',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 5,
        energyLevel: 5,
        grooming: 1,
        isFavorite: false,
      );

      final tCatBreedDifferent = CatBreed(breedId: 'abys', name: 'Abyssinian');

      expect(tCatBreed, equals(tCatBreed2));
      expect(tCatBreed, isNot(equals(tCatBreedDifferent)));
    });

    test('should have a correct hashCode', () {
      final tCatBreed2 = CatBreed(
        breedId: 'beng',
        name: 'Bengal',
        origin: 'United States',
        intelligence: 5,
        imageUrl: 'https://example.com/bengal.jpg',
        temperament: 'Alert, Agile, Energetic, Demanding, Intelligent',
        description: 'Bengals are a lot of fun to live with.',
        lifeSpan: '12 - 15',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 5,
        energyLevel: 5,
        grooming: 1,
        isFavorite: false,
      );

      expect(tCatBreed.hashCode, equals(tCatBreed2.hashCode));

      final expectedHash = Object.hash(
        tCatBreed.breedId,
        tCatBreed.name,
        tCatBreed.origin,
        tCatBreed.intelligence,
        tCatBreed.imageUrl,
        tCatBreed.temperament,
        tCatBreed.description,
        tCatBreed.lifeSpan,
        tCatBreed.adaptability,
        tCatBreed.affectionLevel,
        tCatBreed.childFriendly,
        tCatBreed.dogFriendly,
        tCatBreed.energyLevel,
        tCatBreed.grooming,
        tCatBreed.isFavorite,
      );

      expect(tCatBreed.hashCode, equals(expectedHash));
    });

    test('should return a correct toString format', () {
      final expectedString =
          'CatBreed(breedId: ${tCatBreed.breedId}, name: ${tCatBreed.name}, origin: ${tCatBreed.origin}, '
          'intelligence: ${tCatBreed.intelligence}, temperament: ${tCatBreed.temperament}, '
          'description: ${tCatBreed.description}, lifeSpan: ${tCatBreed.lifeSpan}, adaptability: ${tCatBreed.adaptability}, '
          'affectionLevel: ${tCatBreed.affectionLevel}, childFriendly: ${tCatBreed.childFriendly}, '
          'dogFriendly: ${tCatBreed.dogFriendly}, energyLevel: ${tCatBreed.energyLevel}, grooming: ${tCatBreed.grooming}, isFavorite: ${tCatBreed.isFavorite})';

      expect(tCatBreed.toString(), equals(expectedString));
    });

    test('copyWith should return a new updated instance', () {
      final updatedCat = tCatBreed.copyWith(isFavorite: true, grooming: 2);

      expect(updatedCat.isFavorite, isTrue);
      expect(updatedCat.grooming, 2);
      expect(updatedCat.breedId, tCatBreed.breedId); // Unchanged field
    });
  });
}
