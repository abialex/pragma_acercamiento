import '../../domain/entities/cat_breed.dart';
import 'i_cat_remote_datasource.dart';

class CatRemoteDataSourceImpl implements ICatRemoteDataSource {
  const CatRemoteDataSourceImpl();

  @override
  Future<List<CatBreed>> fetchAllBreeds() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockBreeds;
  }

  @override
  Future<List<CatBreed>> fetchBreedsByOrigin(String origin) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockBreeds.where((breed) => breed.origin == origin).toList();
  }

  @override
  Future<CatBreed?> fetchBreedById(String breedId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _mockBreeds.firstWhere((breed) => breed.breedId == breedId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CatBreed>> searchBreeds(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final lowerQuery = query.toLowerCase();
    return _mockBreeds.where((breed) {
      return breed.name.toLowerCase().contains(lowerQuery) || (breed.origin?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  static final List<CatBreed> _mockBreeds = [
    const CatBreed(
      breedId: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      intelligence: 5,
      imageUrl: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
    ),
    const CatBreed(
      breedId: 'beng',
      name: 'Bengal',
      origin: 'United States',
      intelligence: 4,
      imageUrl: 'https://cdn2.thecatapi.com/images/O3F3_S1XN.jpg',
    ),
    const CatBreed(
      breedId: 'birm',
      name: 'Birman',
      origin: 'France',
      intelligence: 3,
      imageUrl: 'https://cdn2.thecatapi.com/images/HOrX5gwLS.jpg',
    ),
    const CatBreed(
      breedId: 'siam',
      name: 'Siamese',
      origin: 'Thailand',
      intelligence: 5,
      imageUrl: 'https://cdn2.thecatapi.com/images/ai6Jps4sx.jpg',
    ),
    const CatBreed(
      breedId: 'pers',
      name: 'Persian',
      origin: 'Iran',
      intelligence: 3,
      imageUrl: 'https://cdn2.thecatapi.com/images/15CzzU_-g.jpg',
    ),
  ];
}
