import 'package:objectbox/objectbox.dart';

/// Entity for persisting favorite cats using ObjectBox
///
/// This table stores cat breed favorites with their details.
/// Uses ObjectBox annotations for database mapping.
@Entity()
class CatFavoriteTable {
  /// Internal ObjectBox ID (auto-incremented)
  @Id()
  int id = 0;

  /// Breed ID from the API (indexed for fast lookups)
  @Index()
  String breedId;

  /// Name of the cat breed
  String name;

  /// Origin/Country of the breed
  String? origin;

  /// Intelligence level (1-5)
  int? intelligence;

  /// URL of the cat image
  String? imageUrl;

  /// Lowercase version of name for case-insensitive search (indexed)
  @Index()
  String? nameLowerCase;

  /// Timestamp when the favorite was added
  @Property(type: PropertyType.date)
  DateTime createdAt;

  CatFavoriteTable({
    required this.breedId,
    required this.name,
    this.origin,
    this.intelligence,
    this.imageUrl,
    String? nameLowerCase,
    DateTime? createdAt,
  })  : nameLowerCase = nameLowerCase ?? name.toLowerCase(),
        createdAt = createdAt ?? DateTime.now();

  @override
  String toString() {
    return 'CatFavoriteTable(id: $id, breedId: $breedId, name: $name, '
        'origin: $origin, intelligence: $intelligence)';
  }
}
