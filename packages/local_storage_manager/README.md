# Local Storage Manager

A Flutter package that provides an abstraction layer for local storage operations using ObjectBox.

## Features

- **Abstraction Layer**: Interface-based design allows switching implementations
- **ObjectBox Integration**: High-performance NoSQL database
- **Type-Safe Operations**: Generic methods for type safety
- **Reactive Queries**: Stream-based watching for real-time updates
- **Decoupled Design**: No dependency on app-specific entities

## Usage

### 1. Define Your Entities

In your app (not in this package), define your entities with ObjectBox annotations:

```dart
import 'package:objectbox/objectbox.dart';

@Entity()
class CatFavoriteTable {
  @Id()
  int id = 0;
  
  @Index()
  String breedId;
  
  String name;
  String? origin;
  int? intelligence;
  String? imageUrl;
  
  @Index()
  String? nameLowerCase;

  CatFavoriteTable({
    required this.breedId,
    required this.name,
    this.origin,
    this.intelligence,
    this.imageUrl,
    this.nameLowerCase,
  });
}
```

### 2. Initialize Storage

```dart
import 'package:local_storage_manager/local_storage_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart'; // Generated file

final storage = ObjectBoxLocalStorage();

final docsDir = await getApplicationDocumentsDirectory();
await storage.init(
  docsDir.path,
  getObjectBoxModel(),
);
```

### 3. Use Storage Operations

```dart
// Save
await storage.save(catFavorite);

// Get all
final favorites = await storage.getAll<CatFavoriteTable>();

// Watch for changes
storage.watchAll<CatFavoriteTable>().listen((favorites) {
  print('Favorites updated: ${favorites.length}');
});

// Remove by condition
await storage.removeByCondition<CatFavoriteTable>(
  (cat) => cat.breedId == 'abc123',
);

// Remove all
await storage.removeAll<CatFavoriteTable>();
```

## Architecture

This package follows **Clean Architecture** principles:

- **Domain Layer**: `ILocalStorage` interface
- **Data Layer**: `ObjectBoxLocalStorage` implementation
- **Dependency Inversion**: App injects the model definition

## API Reference

### `ILocalStorage`

- `Future<void> init(String directory, dynamic modelDefinition)` - Initialize storage
- `Future<int> save<T>(T entity)` - Save or update entity
- `Future<List<T>> getAll<T>()` - Get all entities
- `Future<T?> getById<T>(int id)` - Get entity by ID
- `Future<int> removeByCondition<T>(bool Function(T) condition)` - Remove matching entities
- `Future<int> removeAll<T>()` - Remove all entities
- `Stream<List<T>> watchAll<T>()` - Watch for changes
- `Future<void> close()` - Close storage
- `bool get isInitialized` - Check if initialized

## Dependencies

- `objectbox`: ^4.0.3
- `objectbox_flutter_libs`: any
- `objectbox_generator`: any (dev)

## License

Private package - not for publication
