import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_acercamiento/data/local/entities/cat_favorite_table.dart';
import 'package:pragma_acercamiento/data/local/mappers/cat_favorite_mappers.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';

void main() {
  group('CatFavorite Mappers', () {
    final tCatBreed = CatBreed(
      breedId: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      intelligence: 5,
      imageUrl: 'https://example.com/abys.jpg',
      isFavorite: false,
    );

    final tCatFavoriteTable = CatFavoriteTable(
      breedId: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      intelligence: 5,
      imageUrl: 'https://example.com/abys.jpg',
      nameLowerCase: 'abyssinian',
    );

    test('toTable should convert CatBreed to CatFavoriteTable', () {
      final result = tCatBreed.toTable();

      expect(result.breedId, equals(tCatFavoriteTable.breedId));
      expect(result.name, equals(tCatFavoriteTable.name));
      expect(result.origin, equals(tCatFavoriteTable.origin));
      expect(result.intelligence, equals(tCatFavoriteTable.intelligence));
      expect(result.imageUrl, equals(tCatFavoriteTable.imageUrl));
      expect(result.nameLowerCase, equals(tCatFavoriteTable.nameLowerCase));
    });

    test('toEntity should convert CatFavoriteTable to CatBreed', () {
      final result = tCatFavoriteTable.toEntity();

      expect(result.breedId, equals(tCatBreed.breedId));
      expect(result.name, equals(tCatBreed.name));
      expect(result.origin, equals(tCatBreed.origin));
      expect(result.intelligence, equals(tCatBreed.intelligence));
      expect(result.imageUrl, equals(tCatBreed.imageUrl));
      expect(result.isFavorite, isTrue);
    });

    test('toEntityList should convert List<CatFavoriteTable> to List<CatBreed>', () {
      final result = [tCatFavoriteTable].toEntityList();

      expect(result, isA<List<CatBreed>>());
      expect(result.length, 1);
      expect(result.first.breedId, tCatFavoriteTable.breedId);
    });

    test('toTableList should convert List<CatBreed> to List<CatFavoriteTable>', () {
      final result = [tCatBreed].toTableList();

      expect(result, isA<List<CatFavoriteTable>>());
      expect(result.length, 1);
      expect(result.first.breedId, tCatBreed.breedId);
      expect(result.first.nameLowerCase, tCatBreed.name.toLowerCase());
    });
  });
}
