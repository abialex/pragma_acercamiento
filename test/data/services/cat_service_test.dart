import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/network_manager.dart';
import 'package:pragma_acercamiento/data/models/cat_filter_model.dart';
import 'package:pragma_acercamiento/data/models/cats_list_response.dart';
import 'package:pragma_acercamiento/data/services/cat_service.dart';

class MockAppNetworkClient extends Mock implements AppNetworkClient {}

void main() {
  late CatService service;
  late MockAppNetworkClient mockNetworkClient;

  setUp(() {
    mockNetworkClient = MockAppNetworkClient();
    service = CatService(mockNetworkClient);
  });

  group('CatService Test', () {
    test('getBreeds should return CatsListResponse when filter is empty', () async {
      when(() => mockNetworkClient.get(any(), queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => [
          {
            "weight": {"imperial": "7  -  10", "metric": "3 - 5"},
            "id": "abys",
            "name": "Abyssinian",
            "breed_group": null,
            "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
            "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
            "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
            "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
            "origin": "Egypt",
            "country_codes": "EG",
            "country_code": "EG",
            "description":
                "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
            "life_span": "14 - 15",
            "indoor": 0,
            "lap": 1,
            "alt_names": "",
            "adaptability": 5,
            "affection_level": 5,
            "child_friendly": 3,
            "dog_friendly": 4,
            "energy_level": 5,
            "grooming": 1,
            "health_issues": 2,
            "intelligence": 5,
            "shedding_level": 2,
            "social_needs": 5,
            "stranger_friendly": 5,
            "vocalisation": 1,
            "experimental": 0,
            "hairless": 0,
            "natural": 1,
            "rare": 0,
            "rex": 0,
            "suppressed_tail": 0,
            "short_legs": 0,
            "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
            "hypoallergenic": 0,
            "reference_image_id": "0XYvRd7oD",
          },
        ],
      );

      final result = await service.getBreeds();

      expect(result, isA<CatsListResponse>());
      expect(result.data.length, 1);
      expect(result.data.first.id, 'abys');
      expect(result.data.first.origin, 'Egypt');
      expect(result.data.first.temperament, 'Active, Energetic, Independent, Intelligent, Gentle');
      expect(result.data.first.weight?.metric, '3 - 5');
      expect(result.data.first.intelligence, 5);
      expect(result.data.first.referenceImageId, '0XYvRd7oD');
      verify(() => mockNetworkClient.get('/breeds', queryParameters: null)).called(1);
    });

    test('getBreeds should pass correct query parameters', () async {
      when(() => mockNetworkClient.get(any(), queryParameters: any(named: 'queryParameters'))).thenAnswer((_) async => []);

      final filter = CatFilterModel(search: 'si', limit: 10, page: 1);
      final result = await service.getBreeds(filter: filter);

      expect(result.data, []);
      verify(() => mockNetworkClient.get('/breeds/search', queryParameters: {'q': 'si', 'limit': 10, 'page': 1})).called(1);
    });
  });
}
