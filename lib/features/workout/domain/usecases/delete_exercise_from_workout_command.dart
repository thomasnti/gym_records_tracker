import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../repositories/workout_repo.dart';

class DeleteExerciseFromWorkoutCommand extends ICommand<List<Exercise>> {
  final Exercise exerciseToDelete;
  final int workoutKey;

  DeleteExerciseFromWorkoutCommand(this.exerciseToDelete, this.workoutKey);
}

@injectable
class DeleteExerciseFromWorkoutCommandHandler
    extends IRequestHandler<List<Exercise>, DeleteExerciseFromWorkoutCommand> {
  final WorkoutRepo _workoutRepo;

  DeleteExerciseFromWorkoutCommandHandler(this._workoutRepo);

  @override
  Future<List<Exercise>> call(DeleteExerciseFromWorkoutCommand request) async {
    final curWorkout = await _workoutRepo.getCurrentWorkout(request.workoutKey);
    final List<Exercise> exercises = curWorkout.exercises;

    // ignore: cascade_invocations
    exercises
        .removeAt(request.exerciseToDelete.exerciseIndex); // remove the exercise we want to delete

    await _workoutRepo.updateWorkout(
      workoutId: request.workoutKey,
      existingWorkoutExercises: exercises,
    );

    return exercises;
  }
}
