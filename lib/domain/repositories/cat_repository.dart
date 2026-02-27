import '../entities/cat_breed.dart';
import '../../data/models/cat_filter_model.dart';

abstract class CatRepository {
  Future<List<CatBreed>> getBreeds({CatFilterModel? filter});
}
