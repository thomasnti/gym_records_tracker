import 'package:get_it/get_it.dart';
import 'package:mediatr/mediatr.dart';

import '../../data/exercises_data.dart';
import 'get_available_exercises_by_muscle_group.dart';

void registerWorkoutHandlers() {
  GetIt.I<Mediator>().registerHandler<
          List<ExerciseInfo>,
          GetAvailableExercisesByMuscleGroup,
          GetAvailableExercisesByMuscleGroupHandler>(
      () => GetIt.I<GetAvailableExercisesByMuscleGroupHandler>());
}
