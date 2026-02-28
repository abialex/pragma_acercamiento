import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_acercamiento/data/models/cat_filter_model.dart';

void main() {
  group('CatFilterModel', () {
    test('should construct correctly', () {
      const model = CatFilterModel(search: 'bengal', limit: 10, page: 1);

      expect(model.search, 'bengal');
      expect(model.limit, 10);
      expect(model.page, 1);
    });

    test('toJson should return correct map', () {
      const model = CatFilterModel(search: 'bengal', limit: 10, page: 1);
      final jsonMap = model.toJson();

      expect(jsonMap, {'q': 'bengal', 'limit': 10, 'page': 1});
    });

    test('fromJson should return correct model', () {
      final jsonMap = {'q': 'bengal', 'limit': 10, 'page': 1};

      final model = CatFilterModel.fromJson(jsonMap);

      expect(model.search, 'bengal');
      expect(model.limit, 10);
      expect(model.page, 1);
    });
  });
}
