import '../../../domain/device/database/table_field.dart';

/// An interface for our database
abstract class IDB {
  Future<String> getDbPath();

  Future<void> createTable(String tableName, List<TableField> fields);

  Future<int> insert(
    String tableName,
    List<TableField> fields,
    Map<String, Object?> data,
  );

  Future<int> update(
    String tableName,
    Map<String, dynamic> data,
    int idFilter,
  );

  Future<void> delete(
    String tableName,
    int id,
  );

  // Future<DatabaseRows> select(
  //   String tableName,
  //   int idFilter,
  // );
  Future<List<Map<String, Object?>>?> select(
    String tableName, {
    int? idFilter,
  });

  Future<bool> tableExists(String tableName);
}
