/// Interface for local storage operations
/// 
/// This is an abstraction layer that allows different implementations
/// (ObjectBox, Hive, SharedPreferences, etc.) without affecting the domain layer.
abstract class ILocalStorage {
  /// Initialize the storage with the directory and model definition
  /// 
  /// [directory] - The directory path where the database will be stored
  /// [modelDefinition] - The ObjectBox model definition (getObjectBoxModel())
  Future<void> init(String directory, dynamic modelDefinition);

  /// Save or update an entity
  /// 
  /// Returns the ID of the saved entity
  Future<int> save<T>(T entity);

  /// Get all entities of type T
  Future<List<T>> getAll<T>();

  /// Remove entities that match the given condition
  /// 
  /// Returns the number of entities removed
  Future<int> removeByCondition<T>(bool Function(T) condition);

  /// Watch all entities of type T for changes
  /// 
  /// Returns a Stream that emits a list of entities whenever there's a change
  Stream<List<T>> watchAll<T>();

  /// Get a single entity by ID
  Future<T?> getById<T>(int id);

  /// Remove all entities of type T
  Future<int> removeAll<T>();

  /// Check if storage is initialized
  bool get isInitialized;

  /// Close the storage
  Future<void> close();
}
