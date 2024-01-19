import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise.dart';
import '../entities/exercise_set.dart';
import '../entities/workout.dart';
import '../repositories/workout_repo.dart';

class AddExerciseCommand extends ICommand<Workout> {
  final String exerciseName;
  final int workoutKey;
  final List<Exercise> existingWorkoutExercises;

  AddExerciseCommand({
    required this.exerciseName,
    required this.workoutKey,
    required this.existingWorkoutExercises,
  });
}

@lazySingleton
class AddExerciseCommandHandler extends IRequestHandler<Workout, AddExerciseCommand> {
  final WorkoutRepo _workoutRepo;

  AddExerciseCommandHandler(this._workoutRepo);
  @override
  Future<Workout> call(AddExerciseCommand request) async {
    // we set setNumber to 1 because the user adds a new exercise so we need to add one set.
    final exerciseToAdd = Exercise(
      exerciseName: request.exerciseName,
      exerciseSets: const [ExerciseSet(setNumber: 1)],
    );

    await _workoutRepo.updateWorkout(
      workoutId: request.workoutKey,
      exerciseToAdd: exerciseToAdd,
      existingWorkoutExercises: request.existingWorkoutExercises,
    );
    // final currentWorkout = await _workoutRepo.getCurrentWorkout(request.workoutKey);
    // return Workout(workoutDate: DateTime.now().toString(), startTime: 'startTime');
    return _workoutRepo.getCurrentWorkout(request.workoutKey);
  }
}
