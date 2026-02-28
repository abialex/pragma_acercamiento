import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_acercamiento/data/models/cat_item_response.dart';

void main() {
  group('CatWeightResponse', () {
    test('toJson should return correct map', () {
      const model = CatWeightResponse(imperial: '7  -  10', metric: '3 - 5');
      final jsonMap = model.toJson();

      expect(jsonMap, {'imperial': '7  -  10', 'metric': '3 - 5'});
    });

    test('fromJson should return correct model', () {
      final jsonMap = {'imperial': '7  -  10', 'metric': '3 - 5'};
      final model = CatWeightResponse.fromJson(jsonMap);

      expect(model.imperial, '7  -  10');
      expect(model.metric, '3 - 5');
    });
  });

  group('CatItemResponse', () {
    test('toJson should return correct map', () {
      const weight = CatWeightResponse(imperial: '7  -  10', metric: '3 - 5');
      const model = CatItemResponse(
        weight: weight,
        id: 'abys',
        name: 'Abyssinian',
        breedGroup: 'Oriental',
        cfaUrl: 'http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx',
        vetstreetUrl: 'http://www.vetstreet.com/cats/abyssinian',
        vcahospitalsUrl: 'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
        temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
        origin: 'Egypt',
        countryCodes: 'EG',
        countryCode: 'EG',
        description: 'The Abyssinian is easy to care for',
        lifeSpan: '14 - 15',
        indoor: 0,
        lap: 1,
        altNames: '',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 3,
        dogFriendly: 4,
        energyLevel: 5,
        grooming: 1,
        healthIssues: 2,
        intelligence: 5,
        sheddingLevel: 2,
        socialNeeds: 5,
        strangerFriendly: 5,
        vocalisation: 1,
        experimental: 0,
        hairless: 0,
        natural: 1,
        rare: 0,
        rex: 0,
        suppressedTail: 0,
        shortLegs: 0,
        wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
        hypoallergenic: 0,
        referenceImageId: '0XYvRd7oD',
      );

      final jsonMap = model.toJson();

      expect(jsonMap, {
        'weight': const CatWeightResponse(imperial: '7  -  10', metric: '3 - 5'),
        'id': 'abys',
        'name': 'Abyssinian',
        'breed_group': 'Oriental',
        'cfa_url': 'http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx',
        'vetstreet_url': 'http://www.vetstreet.com/cats/abyssinian',
        'vcahospitals_url': 'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
        'temperament': 'Active, Energetic, Independent, Intelligent, Gentle',
        'origin': 'Egypt',
        'country_codes': 'EG',
        'country_code': 'EG',
        'description': 'The Abyssinian is easy to care for',
        'life_span': '14 - 15',
        'indoor': 0,
        'lap': 1,
        'alt_names': '',
        'adaptability': 5,
        'affection_level': 5,
        'child_friendly': 3,
        'dog_friendly': 4,
        'energy_level': 5,
        'grooming': 1,
        'health_issues': 2,
        'intelligence': 5,
        'shedding_level': 2,
        'social_needs': 5,
        'stranger_friendly': 5,
        'vocalisation': 1,
        'experimental': 0,
        'hairless': 0,
        'natural': 1,
        'rare': 0,
        'rex': 0,
        'suppressed_tail': 0,
        'short_legs': 0,
        'wikipedia_url': 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
        'hypoallergenic': 0,
        'reference_image_id': '0XYvRd7oD',
      });
    });

    test('fromJson should return correct model', () {
      final jsonMap = {
        'weight': {'imperial': '7  -  10', 'metric': '3 - 5'},
        'id': 'abys',
        'name': 'Abyssinian',
        'breed_group': 'Oriental',
        'cfa_url': 'http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx',
        'vetstreet_url': 'http://www.vetstreet.com/cats/abyssinian',
        'vcahospitals_url': 'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
        'temperament': 'Active, Energetic, Independent, Intelligent, Gentle',
        'origin': 'Egypt',
        'country_codes': 'EG',
        'country_code': 'EG',
        'description': 'The Abyssinian is easy to care for',
        'life_span': '14 - 15',
        'indoor': 0,
        'lap': 1,
        'alt_names': '',
        'adaptability': 5,
        'affection_level': 5,
        'child_friendly': 3,
        'dog_friendly': 4,
        'energy_level': 5,
        'grooming': 1,
        'health_issues': 2,
        'intelligence': 5,
        'shedding_level': 2,
        'social_needs': 5,
        'stranger_friendly': 5,
        'vocalisation': 1,
        'experimental': 0,
        'hairless': 0,
        'natural': 1,
        'rare': 0,
        'rex': 0,
        'suppressed_tail': 0,
        'short_legs': 0,
        'wikipedia_url': 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
        'hypoallergenic': 0,
        'reference_image_id': '0XYvRd7oD',
      };

      final model = CatItemResponse.fromJson(jsonMap);

      expect(model.id, 'abys');
      expect(model.name, 'Abyssinian');
      expect(model.breedGroup, 'Oriental');
      expect(model.weight?.imperial, '7  -  10');
      expect(model.affectionLevel, 5);
      expect(model.referenceImageId, '0XYvRd7oD');
    });
  });
}
