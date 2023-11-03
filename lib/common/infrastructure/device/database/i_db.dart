typedef DatabaseRows = List<Map<String, dynamic>>;

/// An interface for our database
abstract class IDB {
  Future<String> getDbPath();

  Future<void> createTable(String tableName);

  Future<void> insert(
    String tableName,
    Map<String, String?> data,
  );

  Future<int> update(
    String tableName,
    Map<String, String?> data,
  );

  Future<void> delete(
    String tableName,
    int id,
  );

  Future<DatabaseRows> select(
    String tableName,
    int idFilter,
  );
}
