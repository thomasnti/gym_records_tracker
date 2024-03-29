import 'package:get_it/get_it.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../entities/exercise_info.dart';
import '../entities/workout.dart';
import 'add_exercise_command.dart';
import 'add_set_to_exercise_query.dart';
import 'begin_workout_command.dart';
import 'copy_set_command.dart';
import 'delete_exercise_from_workout_command.dart';
import 'delete_set_command.dart';
import 'delete_workout_command.dart';
import 'exercise_set_changed.dart';
import 'finish_workout_command.dart';
import 'get_available_exercises_by_muscle_group.dart';
import 'get_exercise_info_by_exercise_query.dart';

void registerWorkoutHandlers() {
  GetIt.I<Mediator>().registerHandler<List<ExerciseInfo>, GetAvailableExercisesByMuscleGroup,
          GetAvailableExercisesByMuscleGroupHandler>(
      () => GetIt.I<GetAvailableExercisesByMuscleGroupHandler>());

  GetIt.I<Mediator>().registerHandler<int, BeginWorkoutCommand, BeginWorkoutCommandHandler>(
      () => GetIt.I<BeginWorkoutCommandHandler>());

  GetIt.I<Mediator>().registerHandler<void, FinishWorkoutCommand, FinishWorkoutCommandHandler>(
      () => GetIt.I<FinishWorkoutCommandHandler>());

  GetIt.I<Mediator>().registerHandler<Workout, AddExerciseCommand, AddExerciseCommandHandler>(
      () => GetIt.I<AddExerciseCommandHandler>());

  GetIt.I<Mediator>().registerHandler<void, DeleteWorkoutCommand, DeleteWorkoutCommandHandler>(
      () => GetIt.I<DeleteWorkoutCommandHandler>());

  GetIt.I<Mediator>().registerHandler<bool, ExerciseSetChanged, ExerciseSetChangedHandler>(
      () => GetIt.I<ExerciseSetChangedHandler>());

  GetIt.I<Mediator>()
      .registerHandler<List<Exercise>, AddSetToExerciseQuery, AddSetToExerciseQueryHandler>(
          () => GetIt.I<AddSetToExerciseQueryHandler>());

  GetIt.I<Mediator>().registerHandler<ExerciseInfo?, GetExerciseInfoByExerciseQuery,
          GetExerciseInfoByExerciseQueryHandler>(
      () => GetIt.I<GetExerciseInfoByExerciseQueryHandler>());

  GetIt.I<Mediator>().registerHandler<List<Exercise>, DeleteExerciseFromWorkoutCommand,
          DeleteExerciseFromWorkoutCommandHandler>(
      () => GetIt.I<DeleteExerciseFromWorkoutCommandHandler>());

  GetIt.I<Mediator>().registerHandler<List<Exercise>, DeleteSetCommand, DeleteSetCommandHandler>(
      () => GetIt.I<DeleteSetCommandHandler>());

  GetIt.I<Mediator>().registerHandler<List<Exercise>, CopySetCommand, CopySetCommandHandler>(
      () => GetIt.I<CopySetCommandHandler>());
}
