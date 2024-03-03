import '../entities/exercise.dart';
import '../entities/workout.dart';

abstract class WorkoutRepo {
  Future<int> saveWorkout(Workout workout);

  Future<List<Workout>> getSavedWorkouts();

  Future<void> updateWorkout({
    required int workoutId,
    Exercise? exerciseToAdd,
    List<Exercise> existingWorkoutExercises = const [],
    Workout? workoutToUpdate,
  });

// It should return Workout not WorkoutModel, because model is related only with infrastructure
  Future<Workout> getCurrentWorkout(int id);

  Future<void> deleteWorkout(int id);
}
