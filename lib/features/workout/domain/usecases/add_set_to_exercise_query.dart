import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../entities/exercise_set.dart';
import '../repositories/workout_repo.dart';

class AddSetToExerciseQuery extends IQuery<List<Exercise>> {
  final int workoutId;
  final int exerciseIndex; // workout's exercise to add set in

  AddSetToExerciseQuery(
    this.workoutId,
    this.exerciseIndex,
  );
}

@injectable
class AddSetToExerciseQueryHandler extends IRequestHandler<List<Exercise>, AddSetToExerciseQuery> {
  final WorkoutRepo _workoutRepo;

  AddSetToExerciseQueryHandler(this._workoutRepo);

  @override
  Future<List<Exercise>> call(AddSetToExerciseQuery request) async {
    final workout = await _workoutRepo.getCurrentWorkout(request.workoutId);
    final List<Exercise> exercises = workout.exercises;
    final currentExercise = exercises[request.exerciseIndex];

    final newSet = ExerciseSet(setNumber: currentExercise.exerciseSets.length + 1);
    currentExercise.exerciseSets.add(newSet);

    await _workoutRepo.updateWorkout(
      workoutId: request.workoutId,
      existingWorkoutExercises: exercises,
    );

    return exercises;
  }
}
