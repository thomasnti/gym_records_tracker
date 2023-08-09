import '../../data/exercises_data.dart';

abstract class ExerciseRepo {
  Future<List<ExerciseInfo>> getAvailableExercises();
}
