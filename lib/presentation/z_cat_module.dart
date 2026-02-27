import 'package:pragma_acercamiento/presentation/cat_list_screen.dart';
import 'package:pragma_acercamiento/presentation/cat_detail_screen.dart';
import 'package:pragma_acercamiento/domain/entities/cat_breed.dart';
import 'package:router_core/router_core.dart';
import 'package:pragma_acercamiento/config/router/cat_routes.dart';

class CatModule implements IRouteModule {
  @override
  StatefulShellBranch? get branch => null;

  @override
  List<RouteBase> get rootRoutes => [
    GoRoute(
      path: CatRoutes.listcat.path,
      name: CatRoutes.listcat.name,
      builder: (context, state) => const CatListScreen(), // Placeholder for ListCat
    ),
    GoRoute(
      path: CatRoutes.detailcat.path,
      name: CatRoutes.detailcat.name,
      builder: (context, state) {
        // En GoRouter, podemos pasar el objeto como 'extra'
        final cat = state.extra as CatBreed?;
        return CatDetailScreen(
          cat: cat ?? const CatBreed(breedId: 'fake', name: 'Gato Desconocido'),
        );
      },
    ),
  ];
}
