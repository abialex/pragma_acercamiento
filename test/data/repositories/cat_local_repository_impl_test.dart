import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pragma_acercamiento/core/error/failures.dart';
import 'package:pragma_acercamiento/data/local/entities/cat_favorite_table.dart';
import 'package:pragma_acercamiento/data/repositories/cat_local_repository_impl.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:local_storage_manager/local_storage_manager.dart';

class MockLocalStorage extends Mock implements ILocalStorage {}

class FakeCatFavoriteTable extends Fake implements CatFavoriteTable {}

void main() {
  late CatLocalRepositoryImpl repository;
  late MockLocalStorage mockLocalStorage;

  setUpAll(() {
    registerFallbackValue(FakeCatFavoriteTable());
  });

  setUp(() {
    mockLocalStorage = MockLocalStorage();
    repository = CatLocalRepositoryImpl(mockLocalStorage);
  });

  const tCatBreed = CatBreed(
    breedId: '1',
    name: 'Abyssinian',
    description: 'A cat',
    imageUrl: 'url',
    origin: 'Egypt',
    temperament: 'Active',
    lifeSpan: '14-15',
    adaptability: 5,
    intelligence: 5,
    affectionLevel: 5,
  );

  final tCatFavoriteTable = CatFavoriteTable(breedId: '1', name: 'Abyssinian', imageUrl: 'url', origin: 'Egypt', intelligence: 5);

  group('getFavorites', () {
    test('should return List<CatBreed> when successful', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => [tCatFavoriteTable]);

      final result = await repository.getFavorites();

      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Should not be a failure'), (r) {
        expect(r, isA<List<CatBreed>>());
        expect(r.first.breedId, equals('1'));
      });
      verify(() => mockLocalStorage.getAll<CatFavoriteTable>()).called(1);
    });

    test('should return FailureLocal when exception occurs', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenThrow(Exception('test'));

      final result = await repository.getFavorites();

      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<FailureLocal>()), (r) => fail('Should not be a success'));
    });
  });

  group('addFavorite', () {
    test('should do nothing if already favorite', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => [tCatFavoriteTable]);

      final result = await repository.addFavorite(tCatBreed);

      expect(result.isRight(), isTrue);
      verify(() => mockLocalStorage.getAll<CatFavoriteTable>()).called(1);
      verifyNever(() => mockLocalStorage.save(any<CatFavoriteTable>()));
    });

    test('should save if not favorite', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => []);
      when(() => mockLocalStorage.save(any<CatFavoriteTable>())).thenAnswer((_) async => 1);

      final result = await repository.addFavorite(tCatBreed);

      expect(result.isRight(), isTrue);
      verify(() => mockLocalStorage.getAll<CatFavoriteTable>()).called(1);
      verify(() => mockLocalStorage.save(any<CatFavoriteTable>())).called(1);
    });

    test('should return FailureLocal when saving fails', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => []);
      when(() => mockLocalStorage.save(any<CatFavoriteTable>())).thenThrow(Exception('test'));

      final result = await repository.addFavorite(tCatBreed);

      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<FailureLocal>()), (r) => fail('Should not be a success'));
    });
  });

  group('removeFavorite', () {
    test('should remove when exists', () async {
      when(() => mockLocalStorage.removeByCondition<CatFavoriteTable>(any())).thenAnswer((_) async => 1);

      final result = await repository.removeFavorite('1');

      expect(result.isRight(), isTrue);
      verify(() => mockLocalStorage.removeByCondition<CatFavoriteTable>(any())).called(1);
    });

    test('should return FailureLocal when not found', () async {
      when(() => mockLocalStorage.removeByCondition<CatFavoriteTable>(any())).thenAnswer((_) async => 0);

      final result = await repository.removeFavorite('1');

      expect(result.isLeft(), isTrue);
      result.fold((l) {
        expect(l, isA<FailureLocal>());
        expect((l as FailureLocal).error, contains('not found'));
      }, (r) => fail('Should not be a success'));
    });

    test('should return FailureLocal when exception occurs', () async {
      when(() => mockLocalStorage.removeByCondition<CatFavoriteTable>(any())).thenThrow(Exception());

      final result = await repository.removeFavorite('1');

      expect(result.isLeft(), isTrue);
    });
  });

  group('isFavorite', () {
    test('should return true if exists', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => [tCatFavoriteTable]);

      final result = await repository.isFavorite('1');

      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Should not be a failure'), (r) => expect(r, isTrue));
    });

    test('should return false if not exists', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => []);

      final result = await repository.isFavorite('1');

      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Should not be a failure'), (r) => expect(r, isFalse));
    });

    test('should return FailureLocal on error', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenThrow(Exception());

      final result = await repository.isFavorite('1');

      expect(result.isLeft(), isTrue);
    });
  });

  group('toggleFavorite', () {
    test('should call remove if is favorite', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => [tCatFavoriteTable]);
      when(() => mockLocalStorage.removeByCondition<CatFavoriteTable>(any())).thenAnswer((_) async => 1);

      final result = await repository.toggleFavorite(tCatBreed);

      expect(result.isRight(), isTrue);
      verify(() => mockLocalStorage.removeByCondition<CatFavoriteTable>(any())).called(1);
    });

    test('should call add if is not favorite', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenAnswer((_) async => []);
      when(() => mockLocalStorage.save(any<CatFavoriteTable>())).thenAnswer((_) async => 1);

      final result = await repository.toggleFavorite(tCatBreed);

      expect(result.isRight(), isTrue);
      verify(() => mockLocalStorage.save(any<CatFavoriteTable>())).called(1);
    });
    test('should return FailureLocal on toggle error', () async {
      when(() => mockLocalStorage.getAll<CatFavoriteTable>()).thenThrow(Exception());

      final result = await repository.toggleFavorite(tCatBreed);

      expect(result.isLeft(), isTrue);
    });
  });

  group('watchFavorites', () {
    test('should return stream of catbreeds', () {
      when(() => mockLocalStorage.watchAll<CatFavoriteTable>()).thenAnswer((_) => Stream.value([tCatFavoriteTable]));

      final stream = repository.watchFavorites();

      expect(stream, emits(isA<Right<FailureApp, List<CatBreed>>>()));
    });

    test('should return stream of FailureLocal on error', () {
      when(() => mockLocalStorage.watchAll<CatFavoriteTable>()).thenThrow(Exception());

      final stream = repository.watchFavorites();

      expect(stream, emits(isA<Left<FailureApp, List<CatBreed>>>()));
    });
  });

  group('clearAllFavorites', () {
    test('should call removeAll', () async {
      when(() => mockLocalStorage.removeAll<CatFavoriteTable>()).thenAnswer((_) async => 1);

      final result = await repository.clearAllFavorites();

      expect(result.isRight(), isTrue);
      verify(() => mockLocalStorage.removeAll<CatFavoriteTable>()).called(1);
    });

    test('should return failure on error', () async {
      when(() => mockLocalStorage.removeAll<CatFavoriteTable>()).thenThrow(Exception());

      final result = await repository.clearAllFavorites();

      expect(result.isLeft(), isTrue);
    });
  });
}
