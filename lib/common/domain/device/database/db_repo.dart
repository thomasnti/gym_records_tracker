// This is an interface που εχει να κάνει με τη διαχείρηση των βάσεων που είναι αποθηκευμένες στη συσκευή
abstract class DBRepo {
  Future<void> shareDB();

  Future<void> dropDB();

  String getDBName();
}
