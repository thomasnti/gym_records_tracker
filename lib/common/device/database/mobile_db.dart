import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import 'i_db.dart';

@LazySingleton(as: IDB)
class MobileDb extends IDB {
  Database? _db;

  @override
  Future<void> createTable(String query) async {
    // First we create the database
    await _initDB();
    // Then we create a table
    await _db?.execute(query);
  }

  @override
  Future<void> delete(String tableName, int id) {
    throw UnimplementedError();
  }

  @override
  Future<String> getDbPath() {
    throw UnimplementedError();
  }

  @override
  Future<void> insert(String tableName, Map<String, String?> data) {
    throw UnimplementedError();
  }

  @override
  Future<DatabaseRows> select(String tableName, int idFilter) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(String tableName, Map<String, String?> data) {
    throw UnimplementedError();
  }

  Future<void> _initDB() async {
    // ignore: prefer_conditional_assignment
    if (_db == null) {
      _db = await openDatabase(
        'workouts.db',
      );
    }
  }
}
