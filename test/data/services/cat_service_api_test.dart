import 'package:flutter_test/flutter_test.dart';
import 'package:network_manager/network_manager.dart';
import 'package:pragma_acercamiento/domain/models/cat_filter_model.dart';
import 'package:pragma_acercamiento/data/services/cat_service.dart';

void main() {
  group('TheCatAPI Integration Test', () {
    late CatService catService;

    setUpAll(() {
      // Use real network client with TheCatAPI base URL
      final networkClient = AppDioNetworkClient(baseUrl: 'https://api.thecatapi.com/v1', isDebug: true);
      catService = CatService(networkClient);
    });

    test('should fetch breeds with limit and page filter', () async {
      const filter = CatFilterModel(limit: 10, page: 0);
      final response = await catService.getBreeds(filter: filter);

      expect(response.data, isNotEmpty);
      expect(response.data.length, lessThanOrEqualTo(10));
    });

    test('should search breeds by query', () async {
      const filter = CatFilterModel(search: 'si');
      final response = await catService.getBreeds(filter: filter);

      expect(response.data, isNotEmpty);
      // Ensure we get results back for the search
      expect(response.data.length, greaterThan(0));
    });
  });
}
