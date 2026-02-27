import '../../domain/entities/cat_breed.dart';
import '../../domain/repositories/cat_repository.dart';
import '../models/cat_filter_model.dart';
import '../services/cat_service.dart';

class CatRepositoryImpl implements CatRepository {
  final CatService catService;

  const CatRepositoryImpl(this.catService);

  @override
  Future<List<CatBreed>> getBreeds({CatFilterModel? filter}) async {
    try {
      final response = await catService.getBreeds(filter: filter);
      return response.data.map((item) {
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
    } catch (e) {
      // Re-throw or handle error appropriately
      rethrow;
    }
  }
}
