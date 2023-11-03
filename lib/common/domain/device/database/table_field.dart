import 'package:equatable/equatable.dart';

class TableField extends Equatable {
  final String name;
  final String type;
  final bool isPrimaryKey;
  final bool isAutoIncrement;

  const TableField({
    required this.name,
    required this.type,
    this.isPrimaryKey = false,
    this.isAutoIncrement = false,
  });

  @override
  List<Object?> get props => [
        name,
        type,
        isPrimaryKey,
        isAutoIncrement,
      ];
}
