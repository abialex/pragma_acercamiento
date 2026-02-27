import 'package:get_it/get_it.dart';
import 'package:local_storage_manager/local_storage_manager.dart';
import 'package:network_manager/network_manager.dart';
import 'package:pragma_acercamiento/data/datasources/cat_remote_datasource_impl.dart';
import 'package:pragma_acercamiento/data/datasources/i_cat_remote_datasource.dart';
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

    getItApp.registerSingleton<AppNetworkClient>(AppDioNetworkClient(baseUrl: FlavorConfig.apiBaseUrl, isDebug: FlavorConfig.isDev));

    // =========================================================================
    // Data Sources
    // =========================================================================

    getItApp.registerLazySingleton<ICatRemoteDataSource>(() => const CatRemoteDataSourceImpl());
    getItApp.registerLazySingleton<CatService>(() => CatService(getItApp<AppNetworkClient>()));

    // =========================================================================
    // Repositories
    // =========================================================================

    getItApp.registerLazySingleton<ICatLocalRepository>(() => CatLocalRepositoryImpl(getItApp<ILocalStorage>()));
    getItApp.registerLazySingleton<CatRepository>(() => CatRepositoryImpl(getItApp<CatService>()));

    // =========================================================================
    // Use Cases - Add your use cases here
    // =========================================================================

    // Example:
    // sl.registerLazySingleton(() => GetAllBreedsUseCase(sl()));
    // sl.registerLazySingleton(() => AddFavoriteUseCase(sl()));
    // sl.registerLazySingleton(() => RemoveFavoriteUseCase(sl()));

    // =========================================================================
    // State Management (Bloc/Cubit) - Add your blocs/cubits here
    // =========================================================================

    // Example:
    // sl.registerFactory(() => CatBlocBloc(
    //   getAllBreedsUseCase: sl(),
    //   addFavoriteUseCase: sl(),
    // ));
  }

  /// Complete initialization for ObjectBox after code generation
  ///
  /// This should be called after running build_runner to generate objectbox.g.dart
  ///
  /// Example usage in main():
  /// ```dart
  /// await initializeDependencies();
  /// await completeObjectBoxInitialization();
  /// runApp(MyApp());
  /// ```
  Future<void> completeObjectBoxInitialization() async {
    // This function will be implemented after objectbox.g.dart is generated
    //
    // final localStorage = sl<ILocalStorage>() as ObjectBoxLocalStorage;
    // final docsDir = await getApplicationDocumentsDirectory();
    //
    // // Import the generated file
    // // import '../objectbox.g.dart';
    //
    // await localStorage.init(
    //   docsDir.path,
    //   getObjectBoxModel(),
    // );
  }

  /// Clean up resources
  ///
  /// Call this when the app is closed to properly close the database
  Future<void> disposeDependencies() async {
    final localStorage = getItApp<ILocalStorage>();
    await localStorage.close();
    await getItApp.reset();
  }
}
