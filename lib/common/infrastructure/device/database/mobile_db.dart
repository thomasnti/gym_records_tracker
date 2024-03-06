import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/device/database/table_field.dart';
import '../../../domain/services/log_service.dart';
import 'i_db.dart';

@LazySingleton(as: IDB)
class MobileDb extends IDB {
  final LogService _logService;
  Database? _db;

  MobileDb(this._logService);

  @override
  Future<void> createTable(String tableName, List<TableField> fields) async {
    // First we create the database
    await _initDB();
    final fieldsPart = fields
        .map((field) =>
            '${field.name} ${_mapFieldType(field.type)} ${_checkForPrimaryKey(field)} ${_checkForAutoIncrement(field)}')
        .join(',');
    final query = 'CREATE TABLE IF NOT EXISTS $tableName ($fieldsPart)';
    // Then we create a table
    await _db?.execute(query);
  }

  @override
  Future<int> insert(String tableName, List<TableField> fields, Map<String, Object?> data) async {
    await createTable(tableName, fields);
    final newRecordKey = await _db!.insert(tableName, data);

    return newRecordKey;
  }

  @override
  Future<void> delete(String tableName, int id) async {
    await _db?.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<String> getDbPath() {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, Object?>>?> select(String tableName, {int? idFilter}) async {
    await _initDB();
    if (!await tableExists(tableName)) {
      return null;
    }
    var result = await _db?.query(tableName, where: 'id = ?', whereArgs: [idFilter]);

    if (idFilter == null) {
      result = await _db?.query(tableName); // query WITHOUT filters
    }

    _logService.log(result.toString(), eventName: 'SELECT_QUERY');

    if (result != null && result.isNotEmpty) {
      return result;
    }
    return null;
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

  String _checkForPrimaryKey(TableField fld) {
    if (fld.isPrimaryKey) {
      return 'PRIMARY KEY';
    }

    return '';
  }

  String _checkForAutoIncrement(TableField fld) {
    if (fld.isAutoIncrement) {
      return 'AUTOINCREMENT';
    }

    return '';
  }

  @override
  Future<int> update(String tableName, Map<String, dynamic> data, int idFilter) async {
    final rowsAffected = await _db?.update(
      tableName,
      data,
      where: 'id = ?',
      whereArgs: [idFilter],
    );

    return rowsAffected ?? 0;
  }

  @override
  Future<bool> tableExists(String tableName) async {
    await _initDB();
    final query =
        "SELECT 1 as [exists] FROM sqlite_master WHERE type='table' AND name='$tableName'"; // sqlite_master is a special table in SQLite that stores metadata about the database schema
    final result = await _db!.rawQuery(query);

    return result.isNotEmpty;
  }
}
