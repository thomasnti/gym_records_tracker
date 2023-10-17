import 'package:injectable/injectable.dart';

import '../../domain/entities/exercise_info.dart';
import '../../domain/repositories/exercise_repo.dart';
import '../exercises_data.dart';

@LazySingleton(as: ExerciseRepo)
class ExerciseRepoImpl extends ExerciseRepo {
  @override
  Future<List<ExerciseInfo>> getAvailableExercises() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return exercisesData;
  }
}
