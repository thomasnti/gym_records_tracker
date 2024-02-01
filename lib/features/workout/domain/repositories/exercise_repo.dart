import '../entities/exercise_info.dart';

abstract class ExerciseRepo {
  Future<List<ExerciseInfo>> getAvailableExercises();
}
