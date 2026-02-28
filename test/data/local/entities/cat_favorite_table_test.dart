import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_acercamiento/data/local/entities/cat_favorite_table.dart';
import 'package:pragma_acercamiento/objectbox.g.dart'; // Generado

void main() {
  late Store store;

  setUp(() async {
    // Creamos un directorio temporal único para este test
    final tempDir = await Directory.systemTemp.createTemp('objectbox-test');

    // Inicializamos el Store en esa carpeta temporal
    store = Store(getObjectBoxModel(), directory: tempDir.path);
  });

  tearDown(() {
    store.close(); // Cerramos el store
  });

  test('Debería guardar un CatFavoriteTable correctamente', () {
    final box = store.box<CatFavoriteTable>();

    final catFavorite = CatFavoriteTable(
      breedId: 'abys',
      name: 'Abyssinian',
      origin: 'Egypt',
      intelligence: 5,
      imageUrl: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
    );

    box.put(catFavorite);

    expect(box.count(), equals(1));

    // Opcional: Validar que se guardaron los datos correctos
    final savedCat = box.get(catFavorite.id);
    expect(savedCat, isNotNull);
    expect(savedCat!.breedId, equals('abys'));
    expect(savedCat.name, equals('Abyssinian'));
    expect(savedCat.origin, equals('Egypt'));
    expect(savedCat.intelligence, equals(5));
    expect(savedCat.imageUrl, equals('https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'));
    expect(savedCat.nameLowerCase, equals('abyssinian'));
  });
  test('Debería retornar el formato correcto en toString', () {
    final catFavorite = CatFavoriteTable(breedId: 'abys', name: 'Abyssinian', origin: 'Egypt', intelligence: 5);
    catFavorite.id = 1;

    final expectedString = 'CatFavoriteTable(id: 1, breedId: abys, name: Abyssinian, origin: Egypt, intelligence: 5)';
    expect(catFavorite.toString(), equals(expectedString));
  });
}
