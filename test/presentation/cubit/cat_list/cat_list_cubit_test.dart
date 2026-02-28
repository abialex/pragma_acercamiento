import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pragma_acercamiento/core/error/failures.dart';
import 'package:pragma_acercamiento/data/models/cat_filter_model.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/domain/repositories/cat_repository.dart';
import 'package:pragma_acercamiento/domain/repositories/i_cat_local_repository.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_cubit.dart';
import 'package:pragma_acercamiento/presentation/cubit/cat_list/cat_list_state.dart';

class MockCatRepository extends Mock implements CatRepository {}

class MockCatLocalRepository extends Mock implements ICatLocalRepository {}

void main() {
  late CatListCubit cubit;
  late MockCatRepository mockCatRepository;
  late MockCatLocalRepository mockCatLocalRepository;

  setUp(() {
    registerFallbackValue(CatBreed(breedId: 'fake', name: 'fake', origin: 'fake', intelligence: 0, imageUrl: ''));
    mockCatRepository = MockCatRepository();
    mockCatLocalRepository = MockCatLocalRepository();
    cubit = CatListCubit(mockCatRepository, mockCatLocalRepository);
  });

  tearDown(() {
    cubit.close();
  });

  final tCatBreed1 = CatBreed(
    breedId: 'beng',
    name: 'Bengal',
    origin: 'US',
    intelligence: 5,
    temperament: 'Active',
    imageUrl: 'image1.jpg',
  );

  final tCatBreed2 = CatBreed(
    breedId: 'abys',
    name: 'Abyssinian',
    origin: 'Egypt',
    intelligence: 5,
    temperament: 'Active',
    imageUrl: 'image2.jpg',
  );

  group('CatListCubit', () {
    test('initial state should be empty and not loading', () {
      expect(cubit.state, const CatListState());
    });

    group('getList', () {
      test('emits [loading, data] when successful in normal mode', () async {
        // Arrange
        when(() => mockCatRepository.getBreeds(filter: any(named: 'filter'))).thenAnswer((_) async => right([tCatBreed1]));
        when(() => mockCatLocalRepository.getFavorites()).thenAnswer((_) async => right([]));

        // Act
        final futureResult = cubit.getList();

        // Assert
        expect(cubit.state.isLoading, true);
        await futureResult;

        expect(cubit.state.isLoading, false);
        expect(cubit.state.catsList, [tCatBreed1]);
      });

      test('marks cats as favorite if they exist in local repository', () async {
        // Arrange
        when(() => mockCatRepository.getBreeds(filter: any(named: 'filter'))).thenAnswer((_) async => right([tCatBreed1, tCatBreed2]));
        when(() => mockCatLocalRepository.getFavorites()).thenAnswer((_) async => right([tCatBreed1.copyWith(isFavorite: true)]));

        // Act
        await cubit.getList();

        // Assert
        expect(cubit.state.catsList[0].isFavorite, true);
        expect(cubit.state.catsList[1].isFavorite, false);
      });

      test('emits [loading, error] when repository fails', () async {
        // Arrange
        final failure = FailureApi(error: 'Server Error', statusCode: 500);
        when(() => mockCatRepository.getBreeds(filter: any(named: 'filter'))).thenAnswer((_) async => left(failure));

        // Act
        final result = await cubit.getList();

        // Assert
        expect(cubit.state.isLoading, false);
        result.match((l) => expect(l, failure), (r) => fail('Should return failure'));
      });
    });

    group('Favorites Mode', () {
      test('toggleFavoritesMode updates state and fetches local only', () async {
        // Arrange
        when(() => mockCatLocalRepository.getFavorites()).thenAnswer((_) async => right([tCatBreed1.copyWith(isFavorite: true)]));

        // Act
        await cubit.toggleFavoritesMode(true);

        // Assert
        expect(cubit.state.isFavoritesMode, true);
        expect(cubit.state.catsList.length, 1);
        expect(cubit.state.catsList.first.breedId, 'beng');
        // Remote repository shouldn't be called in favorites mode
        verifyNever(() => mockCatRepository.getBreeds(filter: any(named: 'filter')));
      });

      test('toggleFavoritesMode filters using search query in local favorites', () async {
        // Arrange
        cubit.emit(cubit.state.copyWith(isFavoritesMode: true));
        when(() => mockCatLocalRepository.getFavorites()).thenAnswer(
          (_) async => right([
            tCatBreed1.copyWith(isFavorite: true), // Bengal
            tCatBreed2.copyWith(isFavorite: true), // Abyssinian
          ]),
        );

        // Act
        await cubit.getList(filter: const CatFilterModel(search: 'bengal'));

        // Assert
        expect(cubit.state.catsList.length, 1);
        expect(cubit.state.catsList.first.name, 'Bengal');
      });
    });

    group('toggleFavorite (Individual Item)', () {
      test('adds to local favorites when not favorite', () async {
        // Arrange
        cubit.emit(cubit.state.copyWith(catsList: [tCatBreed1]));
        when(() => mockCatLocalRepository.addFavorite(any())).thenAnswer((_) async => right(unit));

        // Act
        final result = await cubit.toggleFavorite(tCatBreed1.breedId);

        // Assert
        result.match((l) => fail('Should succeed'), (r) => expect(cubit.state.catsList.first.isFavorite, true));
        verify(() => mockCatLocalRepository.addFavorite(any())).called(1);
      });

      test('removes from list directly if in favorites mode', () async {
        // Arrange
        cubit.emit(cubit.state.copyWith(isFavoritesMode: true, catsList: [tCatBreed1.copyWith(isFavorite: true)]));
        when(() => mockCatLocalRepository.removeFavorite(any())).thenAnswer((_) async => right(unit));

        // Act
        await cubit.toggleFavorite(tCatBreed1.breedId);

        // Assert
        expect(cubit.state.catsList.isEmpty, true);
        verify(() => mockCatLocalRepository.removeFavorite('beng')).called(1);
      });
    });
  });
}
