import 'package:fpdart/fpdart.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/cat_breed.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../domain/models/cat_filter_model.dart';
import '../services/cat_service.dart';

class CatRepositoryImpl implements CatRepository {
  final CatService catService;

  const CatRepositoryImpl(this.catService);

  @override
  Future<Either<FailureApp, List<CatBreed>>> getBreeds({CatFilterModel? filter}) async {
    try {
      final response = await catService.getBreeds(filter: filter);
      final list = response.data.map((item) {
        return CatBreed(
          breedId: item.id ?? '',
          name: item.name ?? 'Unknown',
          origin: item.origin,
          intelligence: item.intelligence,
          imageUrl: item.referenceImageId != null ? 'https://cdn2.thecatapi.com/images/${item.referenceImageId}.jpg' : null,
          temperament: item.temperament,
          description: item.description,
          lifeSpan: item.lifeSpan,
          adaptability: item.adaptability,
          affectionLevel: item.affectionLevel,
          childFriendly: item.childFriendly,
          dogFriendly: item.dogFriendly,
          energyLevel: item.energyLevel,
          grooming: item.grooming,
        );
      }).toList();
      return right(list);
    } catch (e) {
      // You can implement specific DioError handling here
      return left(FailureApi(error: 'Error connecting to API: $e', statusCode: 500));
    }
  }
}
