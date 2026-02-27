import 'dart:async';
import 'package:objectbox/objectbox.dart';
import 'i_local_storage.dart';

/// ObjectBox implementation of ILocalStorage
///
/// This class provides a concrete implementation using ObjectBox.
/// The model definition is injected from outside to maintain decoupling.
class ObjectBoxLocalStorage implements ILocalStorage {
  Store? _store;
  bool _isInitialized = false;

  @override
  bool get isInitialized => _isInitialized;

  @override
  Future<void> init(String directory, dynamic modelDefinition) async {
    if (_isInitialized) {
      throw StateError('Storage is already initialized');
    }

    try {
      // The modelDefinition should be the getObjectBoxModel() function result
      _store = Store(
        modelDefinition,
        directory: directory,
      );
      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize ObjectBox: $e');
    }
  }

  /// Get the box for a specific entity type
  Box<T> _getBox<T>() {
    if (!_isInitialized || _store == null) {
      throw StateError('Storage is not initialized. Call init() first.');
    }
    return _store!.box<T>();
  }

  @override
  Future<int> save<T>(T entity) async {
    try {
      final box = _getBox<T>();
      return box.put(entity);
    } catch (e) {
      throw Exception('Failed to save entity: $e');
    }
  }

  @override
  Future<List<T>> getAll<T>() async {
    try {
      final box = _getBox<T>();
      return box.getAll();
    } catch (e) {
      throw Exception('Failed to get all entities: $e');
    }
  }

  @override
  Future<int> removeByCondition<T>(bool Function(T) condition) async {
    try {
      final box = _getBox<T>();
      final allEntities = box.getAll();
      final idsToRemove = <int>[];

      for (final entity in allEntities) {
        if (condition(entity)) {
          // Assuming the entity has an 'id' property
          // We need to get the ID using reflection or a known interface
          final id = _getEntityId(entity);
          if (id != null && id > 0) {
            idsToRemove.add(id);
          }
        }
      }

      if (idsToRemove.isEmpty) {
        return 0;
      }

      box.removeMany(idsToRemove);
      return idsToRemove.length;
    } catch (e) {
      throw Exception('Failed to remove entities by condition: $e');
    }
  }

  @override
  Stream<List<T>> watchAll<T>() {
    try {
      final box = _getBox<T>();
      return box.query().watch(triggerImmediately: true).map((query) {
        return query.find();
      });
    } catch (e) {
      throw Exception('Failed to watch entities: $e');
    }
  }

  @override
  Future<T?> getById<T>(int id) async {
    try {
      final box = _getBox<T>();
      return box.get(id);
    } catch (e) {
      throw Exception('Failed to get entity by id: $e');
    }
  }

  @override
  Future<int> removeAll<T>() async {
    try {
      final box = _getBox<T>();
      return box.removeAll();
    } catch (e) {
      throw Exception('Failed to remove all entities: $e');
    }
  }

  @override
  Future<void> close() async {
    if (_store != null) {
      _store!.close();
      _store = null;
      _isInitialized = false;
    }
  }

  /// Helper method to extract the ID from an entity
  ///
  /// This uses dynamic access to get the 'id' property.
  /// In a real-world scenario, you might want to use a base interface
  /// or a more sophisticated approach.
  int? _getEntityId(dynamic entity) {
    try {
      // Try to access the 'id' property dynamically
      // ignore: avoid_dynamic_calls
      return entity.id as int?;
    } catch (e) {
      return null;
    }
  }
}
