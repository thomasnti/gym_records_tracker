import '../entities/exercise.dart';
import '../entities/workout.dart';

abstract class WorkoutRepo {
  Future<int> saveWorkout(Workout workout);

  Future<void> getSavedWorkouts();

  Future<void> updateWorkout({
    required int workoutId,
    required Exercise exerciseToAdd,
    required List<Exercise> existingWorkoutExercises,
  });

// It should return Workout not WorkoutModel, because model is related only with infrastructure
  Future<Workout> getCurrentWorkout(int id);
}
