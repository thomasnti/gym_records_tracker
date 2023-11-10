import '../../data/models/workout_model.dart';
import '../entities/exercise.dart';
import '../entities/workout.dart';

abstract class WorkoutRepo {
  Future<int> saveWorkout(Workout workout);

  Future<void> getSavedWorkouts();

  Future<void> updateWorkout(Exercise exercise, int id);

  Future<WorkoutModel> getCurrentWorkout(int id);
}
