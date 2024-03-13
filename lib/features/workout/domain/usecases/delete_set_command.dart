import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../entities/exercise_set.dart';
import '../repositories/workout_repo.dart';

class DeleteSetCommand extends ICommand<List<Exercise>> {
  final int workoutKey;
  final int setIndex;
  final int exerciseIndex;

  DeleteSetCommand({
    required this.workoutKey,
    required this.setIndex,
    required this.exerciseIndex,
  });
}

@injectable
class DeleteSetCommandHandler extends IRequestHandler<List<Exercise>, DeleteSetCommand> {
  final WorkoutRepo _workoutRepo;

  DeleteSetCommandHandler(this._workoutRepo);

  @override
  Future<List<Exercise>> call(DeleteSetCommand request) async {
    final curWorkout = await _workoutRepo.getCurrentWorkout(request.workoutKey);
    final curExercise = curWorkout.exercises[request.exerciseIndex];

    curExercise.exerciseSets.removeAt(request.setIndex);

    final curExerciseWithNewSetNums = _reOrderSetNumbers(curExercise);

    curWorkout.exercises[request.exerciseIndex] =
        curExerciseWithNewSetNums; // replace the current exercise

    await _workoutRepo.updateWorkout(
      workoutId: request.workoutKey,
      existingWorkoutExercises: curWorkout.exercises,
    );

    return curWorkout.exercises;
  }

  Exercise _reOrderSetNumbers(Exercise exercise) {
    final sets = exercise.exerciseSets;
    final newSets = <ExerciseSet>[];

    sets.asMap().forEach(
      (index, el) {
        newSets.add(el.copyWith(
          setNumber: index + 1,
        ));
      },
    );

    final exerciseWithReOrdedSets = exercise.copyWith(
      exerciseSets: newSets,
    );

    return exerciseWithReOrdedSets;
  }
}
