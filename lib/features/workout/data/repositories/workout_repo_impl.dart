import 'package:injectable/injectable.dart';

import '../../../../common/domain/device/database/table_field.dart';
import '../../../../common/infrastructure/device/database/i_db.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repo.dart';
import '../models/exercise_mapper.dart' as exercise_mapper;
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
  Future<Workout> getCurrentWorkout(int id) async {
    final savedWorkout = await _db.select(_tableName, id);
    if (savedWorkout == null || savedWorkout.length > 1) {
      //* Log Something
    }
    // if (savedWorkout != null && savedWorkout.length == 1) {}
    final workouts = savedWorkout!.map((e) {
      return WorkoutModel.fromJson(e);
    }).toList();

    final workoutModel = workouts[0];

    return Workout(
      workoutDate: workoutModel.workoutDate,
      startTime: workoutModel.startTime,
      endTime: workoutModel.endTime,
      exercises: exercise_mapper.mapExercises(workoutModel.exercises),
    );
  }

  @override
  Future<void> updateWorkout({
    required int workoutId,
    Exercise? exerciseToAdd,
    List<Exercise> existingWorkoutExercises = const [],
    Workout? workoutToUpdate,
  }) async {
    Map<String, String> setClause = {};
    final exercisesBuffer = StringBuffer(); // the data to update

    for (final exercise in existingWorkoutExercises) {
      exercisesBuffer.write('${exercise.toJson()},');
    }

    // append the new exercise
    if (exerciseToAdd != null) {
      exercisesBuffer.write(exerciseToAdd.toJson());
      // Αν δεν ειναι κενο θα πρεπει να φτιαχνω ενα string . Θα looparw τα existingWorkoutExercises και θα εκτελώ exercise.toJson(), το αποτελεσμα θα το κανω append σε ενα string . Στο τελος θα προσθετω το existing
      setClause = {'EXERCISES': '[$exercisesBuffer]'};
    }

    if (workoutToUpdate != null) {
      setClause['END_TIME'] = workoutToUpdate.endTime!;
    }

    await _db.update(
      _tableName,
      setClause,
      workoutId,
    );
  }
}
