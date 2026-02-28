import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:local_storage_manager/local_storage_manager.dart';
import 'package:network_manager/network_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pragma_acercamiento/objectbox.g.dart';
import 'package:pragma_acercamiento/data/repositories/cat_local_repository_impl.dart';
import 'package:pragma_acercamiento/domain/repositories/i_cat_local_repository.dart';
import 'package:pragma_acercamiento/flavors/flavor_config.dart';
import 'package:pragma_acercamiento/data/services/cat_service.dart';
import 'package:pragma_acercamiento/domain/repositories/cat_repository.dart';
import 'package:pragma_acercamiento/data/repositories/cat_repository_impl.dart';

/// Global service locator instance
final getItApp = GetIt.instance;

class InjectionContainer {
  /// Initialize all dependencies
  ///
  /// This function sets up the dependency injection container with all services,
  /// repositories, and data sources needed by the app.
  ///
  /// Call this in main() before runApp().
  Future<void> init() async {
    // =========================================================================
    // External Dependencies
    // =========================================================================

    // Initialize ObjectBox Local Storage
    getItApp.registerSingleton<ILocalStorage>(ObjectBoxLocalStorage());

    // Initialize storage with ObjectBox model
    // Note: objectbox.g.dart will be generated after running build_runner
    // await localStorage.init(
    //   docsDir.path,
    //   getObjectBoxModel(), // This comes from objectbox.g.dart
    // );

    // =========================================================================
    // Network Client
    // =========================================================================

    // Obtener API_KEY desde variables de entorno
    final apiKey = dotenv.env['API_KEY'];

    getItApp.registerSingleton<AppNetworkClient>(
      AppDioNetworkClient(baseUrl: FlavorConfig.apiBaseUrl, isDebug: FlavorConfig.isDev, enableApiKey: true, apiKey: apiKey),
    );

    // =========================================================================
    // Data Sources
    // =========================================================================

    getItApp.registerLazySingleton<CatService>(() => CatService(getItApp<AppNetworkClient>()));

    // =========================================================================
    // Repositories
    // =========================================================================

    getItApp.registerLazySingleton<ICatLocalRepository>(() => CatLocalRepositoryImpl(getItApp<ILocalStorage>()));
    getItApp.registerLazySingleton<CatRepository>(() => CatRepositoryImpl(getItApp<CatService>()));
  }

  Future<void> completeObjectBoxInitialization() async {
    final localStorage = getItApp<ILocalStorage>();
    final docsDir = await getApplicationDocumentsDirectory();

    await localStorage.init(docsDir.path, getObjectBoxModel());
  }

  Future<void> disposeDependencies() async {
    final localStorage = getItApp<ILocalStorage>();
    await localStorage.close();
    await getItApp.reset();
  }
}
