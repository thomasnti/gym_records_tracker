import 'package:injectable/injectable.dart';

import '../../../../common/domain/device/database/table_field.dart';
import '../../../../common/infrastructure/device/database/i_db.dart';
import '../../domain/repositories/workout_repo.dart';

@LazySingleton(as: WorkoutRepo)
class WorkoutRepoImpl extends WorkoutRepo {
  final IDB db;

  final _tableName = 'WORKOUTS_HISTORY';
  final _tableFields = <TableField>[
    const TableField(
      name: 'WORKOUT_DATE',
      type: 'datetime',
      isPrimaryKey: true,
    ),
    const TableField(
      name: 'START_TIME',
      type: 'datetime',
    ),
    const TableField(
      name: 'END_TIME',
      type: 'datetime',
    ),
    const TableField(
      name: 'EXERCISES',
      type: 'string',
    )
  ];

  WorkoutRepoImpl(this.db);
  @override
  Future<void> saveWorkout() async {
    // await db.insert(tableName, data);
    await db.createTable(
      _tableName,
      _tableFields,
    );
  }
}
