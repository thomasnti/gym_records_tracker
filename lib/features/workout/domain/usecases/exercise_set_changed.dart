import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../repositories/workout_repo.dart';

class ExerciseSetChanged extends IQuery<bool> {
  final double newValue;
  final bool weightChanged; // if false it means reps changed
  final int setIndex;
  final int exerciseIndex;
  final int workoutId;

  ExerciseSetChanged(
    this.newValue,
    this.weightChanged,
    this.setIndex,
    this.exerciseIndex,
    this.workoutId,
  );
}

@injectable
class ExerciseSetChangedHandler extends IRequestHandler<bool, ExerciseSetChanged> {
  final WorkoutRepo _workoutRepo;

  ExerciseSetChangedHandler(this._workoutRepo);

  @override
  Future<bool> call(ExerciseSetChanged request) async {
    final workout = await _workoutRepo.getCurrentWorkout(request.workoutId);
    final List<Exercise> exercises = workout.exercises;

    final setToChange = exercises[request.exerciseIndex].exerciseSets[request.setIndex];
    final newSet = setToChange.copyWith(
      kilos: request.weightChanged ? request.newValue : setToChange.kilos,
      repetitions: request.weightChanged == false ? request.newValue : setToChange.repetitions,
    );

    exercises[request.exerciseIndex].exerciseSets[request.setIndex] = newSet;

    await _workoutRepo.updateWorkout(
      workoutId: request.workoutId,
      existingWorkoutExercises: exercises,
    );

    return true;
  }
}
