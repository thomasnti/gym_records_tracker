import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../repositories/workout_repo.dart';

class CopySetCommand extends ICommand<List<Exercise>> {
  final int workoutKey;
  final int setIndex;
  final int exerciseIndex;

  CopySetCommand({
    required this.workoutKey,
    required this.setIndex,
    required this.exerciseIndex,
  });
}

@injectable
class CopySetCommandHandler extends IRequestHandler<List<Exercise>, CopySetCommand> {
  final WorkoutRepo _workoutRepo;

  CopySetCommandHandler(this._workoutRepo);

  @override
  Future<List<Exercise>> call(CopySetCommand request) async {
    final curWorkout = await _workoutRepo.getCurrentWorkout(request.workoutKey);
    final curExercise = curWorkout.exercises[request.exerciseIndex];
    final setToCopy = curExercise.exerciseSets[request.setIndex];

    curExercise.exerciseSets.add(
      setToCopy.copyWith(
        setNumber: curExercise.exerciseSets.length + 1, // we change only the set number
      ),
    );

    await _workoutRepo.updateWorkout(
      workoutId: request.workoutKey,
      existingWorkoutExercises: curWorkout.exercises,
    );

    return curWorkout.exercises;
  }
}
