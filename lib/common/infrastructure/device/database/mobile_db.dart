import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/device/database/table_field.dart';
import 'i_db.dart';

@LazySingleton(as: IDB)
class MobileDb extends IDB {
  Database? _db;

  @override
  Future<void> createTable(String tableName, List<TableField> fields) async {
    // First we create the database
    await _initDB();
    final fieldsPart =
        fields.map((field) => '${field.name} ${_mapFieldType(field.type)}').join(',');
    final query = 'CREATE TABLE IF NOT EXISTS $tableName ($fieldsPart)';
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

  String _mapFieldType(String type) {
    switch (type) {
      case 'int':
        return 'INTEGER';
      case 'smallint':
        return 'SMALLINT';
      case 'float':
        return 'REAL';
      case 'bool':
        return 'BOOLEAN';
      case 'date':
        return 'DATE';
      case 'datetime':
        return 'DATETIME';
      default:
        return 'TEXT';
    }
  }
}
