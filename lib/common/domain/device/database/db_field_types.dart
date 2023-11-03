enum DBFieldTypes {
  int,
  smallint,
  float,
  bool,
  date,
  datetime,
  string,
}

extension DBFieldTypesExtension on DBFieldTypes {
  String get asStr {
    return toString().split('.').last;
  }
}
