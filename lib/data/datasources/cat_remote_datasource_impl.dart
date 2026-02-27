import '../../domain/entities/cat_breed.dart';
import 'i_cat_remote_datasource.dart';

/// Mock implementation of ICatRemoteDataSource
///
/// This is a placeholder implementation that returns sample data.
/// Replace this with a real API implementation using your network_manager package.
class CatRemoteDataSourceImpl implements ICatRemoteDataSource {
  // TODO: Inject your AppNetworkClient from network_manager package
  // final AppNetworkClient networkClient;

  const CatRemoteDataSourceImpl();

  @override
  Future<List<CatBreed>> fetchAllBreeds() async {
    // TODO: Implement actual API call
    // Example:
    // final response = await networkClient.get('/breeds');
    // return (response.data as List).map((json) => CatBreed.fromJson(json)).toList();

    // Mock data for now
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockBreeds;
  }

  @override
  Future<List<CatBreed>> fetchBreedsByOrigin(String origin) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockBreeds.where((breed) => breed.origin == origin).toList();
  }

  @override
  Future<CatBreed?> fetchBreedById(String breedId) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _mockBreeds.firstWhere((breed) => breed.breedId == breedId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CatBreed>> searchBreeds(String query) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(milliseconds: 300));
    final lowerQuery = query.toLowerCase();
    return _mockBreeds.where((breed) {
      return breed.name.toLowerCase().contains(lowerQuery) || (breed.origin?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  // Mock data
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
