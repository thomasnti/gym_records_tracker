import 'package:injectable/injectable.dart';

import '../../../../common/domain/device/database/table_field.dart';
import '../../../../common/infrastructure/device/database/i_db.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repo.dart';
import '../models/workout_model.dart';

@LazySingleton(as: WorkoutRepo)
class WorkoutRepoImpl extends WorkoutRepo {
  final IDB _db;

  final _tableName = 'WORKOUTS_HISTORY';
  final _tableFields = <TableField>[
    const TableField(
      name: 'id',
      type: 'int',
      isPrimaryKey: true,
      isAutoIncrement: true,
    ),
    const TableField(
      name: 'WORKOUT_DATE',
      type: 'datetime',
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

  WorkoutRepoImpl(this._db);
  @override
  Future<int> saveWorkout(Workout workout) async {
    // https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md
    // sqflite supports only num, String or Uint8List types as column values
    return _db.insert(
      _tableName,
      _tableFields,
      {
        // Πρέπει να βάλω και ένα id που θα είναι auto-increment και primary key. Θα πρέπει να μου το γυρναέι η sql ώστε να το χρησιμοποιώ στο state για να κανω update ή και delete. Επίσης πρέπει να τσεκάρω αν πρέπει να το περνάω κάθε φορά που κάνω insert.
        'WORKOUT_DATE': workout.workoutDate,
        'START_TIME': workout.startTime,
        'END_TIME': workout.endTime,
        'EXERCISES': workout.exercises.toString(),
      },
    );
  }

  @override
  Future<void> getSavedWorkouts() {
    throw UnimplementedError();
  }

  @override
  Future<WorkoutModel> getCurrentWorkout(int id) async {
    final savedWorkout = await _db.select(_tableName, id);
    if (savedWorkout == null || savedWorkout.length > 1) {
      //* Log Something
    }
    // if (savedWorkout != null && savedWorkout.length == 1) {}
    final workouts = savedWorkout!.map((e) {
      return WorkoutModel.fromJson(e);
    }).toList();

    return workouts[0];
  }

  @override
  Future<void> updateWorkout(Exercise exercise, int id) async {
    // The Set clause allows you to specify the columns and their new values that you want to update while leaving the rest of the row unchanged.
    final setClause = {'EXERCISES': exercise.toJson()};
    await _db.update(_tableName, setClause, id);
  }
}
