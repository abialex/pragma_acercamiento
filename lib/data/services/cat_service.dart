import 'package:network_manager/network_manager.dart';
import '../models/cat_filter_model.dart';
import '../models/cats_list_response.dart';

class CatService {
  final AppNetworkClient networkClient;

  const CatService(this.networkClient);

  Future<CatsListResponse> getBreeds({CatFilterModel? filter}) async {
    final path = filter?.search != null && filter!.search!.isNotEmpty ? '/breeds/search' : '/breeds';

    final queryParameters = <String, dynamic>{};
    if (filter?.search != null && filter!.search!.isNotEmpty) {
      queryParameters['q'] = filter.search;
    }
    if (filter?.limit != null) {
      queryParameters['limit'] = filter!.limit;
    }
    if (filter?.page != null) {
      queryParameters['page'] = filter!.page;
    }

    final response = await networkClient.get(path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    // TheCatAPI returns a JSON array directly.
    return CatsListResponse.fromJson(response as List<dynamic>);
  }
}
