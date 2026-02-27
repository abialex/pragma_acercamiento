import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pragma_acercamiento/data/models/cat_item_response.dart';
import 'package:pragma_acercamiento/data/models/cats_list_response.dart';
import 'package:pragma_acercamiento/data/repositories/cat_repository_impl.dart';
import 'package:pragma_acercamiento/data/services/cat_service.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:pragma_acercamiento/data/models/cat_filter_model.dart';

class MockCatService extends Mock implements CatService {}

void main() {
  late CatRepositoryImpl repository;
  late MockCatService mockCatService;

  setUp(() {
    mockCatService = MockCatService();
    repository = CatRepositoryImpl(mockCatService);
    registerFallbackValue(const CatFilterModel());
  });

  group('CatRepositoryImpl Test', () {
    test('getBreeds should map CatsListResponse to List<CatBreed>', () async {
      when(() => mockCatService.getBreeds(filter: any(named: 'filter'))).thenAnswer(
        (_) async => CatsListResponse(
          data: [
            CatItemResponse(id: 'beng', name: 'Bengal', origin: 'US', intelligence: 5, temperament: 'Active', referenceImageId: 'image123'),
          ],
        ),
      );

      final result = await repository.getBreeds();

      expect(result, isA<List<CatBreed>>());
      expect(result.length, 1);
      expect(result.first.breedId, 'beng');
      expect(result.first.name, 'Bengal');
      expect(result.first.origin, 'US');
      expect(result.first.imageUrl, 'https://cdn2.thecatapi.com/images/image123.jpg');
      verify(() => mockCatService.getBreeds(filter: null)).called(1);
    });
  });
}
