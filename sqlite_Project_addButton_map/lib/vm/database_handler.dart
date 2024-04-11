import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/store.dart';

class DatabaseHandler {
  Future<Database> initalizeDB() async {
    String path = await getDatabasesPath();
    print(path);
    return openDatabase(
      join(path, 'store.db'),
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE stores (id integer primary key autoincrement, name text, phone text, estimate text, lat text, lng text, image blob)');
      },
      version: 1,
    );
  }

  Future<List<Store>> queryStores() async {
    final Database db = await initalizeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('SELECT * FROM stores');
    return queryResult.map((e) => Store.fromMap(e)).toList();
  }

  Future<int> insertStores(Store store) async {
    int result = 0;
    final Database db = await initalizeDB();
    result = await db.rawInsert(
        'INSERT INTO stores (name, phone, estimate, lat, lng, image) VALUES (?,?,?,?,?,?)',
        [
          store.name,
          store.phone,
          store.estimate,
          store.lat,
          store.lng,
          store.image
        ]);
    return result;
  }

  Future<void> updateStores(Store store) async {
    final Database db = await initalizeDB();
    await db.rawUpdate(
        'UPDATE stores SET name=?, phone=?, estimate=?, lat=?, lng=?, image=? where name=?',
        [
          store.name,
          store.phone,
          store.estimate,
          store.lat,
          store.lng,
          store.image,
          store.name // Where 절에 사용될 id
        ]);
  }

  Future<void> deleteStores(String name) async {
    final Database db = await initalizeDB();
    await db.rawUpdate('DELETE FROM stores WHERE name=?', [name]);
  }
}
