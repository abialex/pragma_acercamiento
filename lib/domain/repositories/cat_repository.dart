import 'package:fpdart/fpdart.dart';
import '../../core/error/failures.dart';
import '../entities/cat_breed.dart';
import '../../data/models/cat_filter_model.dart';

abstract class CatRepository {
  Future<Either<FailureApp, List<CatBreed>>> getBreeds({CatFilterModel? filter});
}
