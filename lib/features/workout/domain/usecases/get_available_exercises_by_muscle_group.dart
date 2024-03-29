import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise_info.dart';
import '../repositories/exercise_repo.dart';

class GetAvailableExercisesByMuscleGroup extends IQuery<List<ExerciseInfo>> {
  final String bodyPart;

  GetAvailableExercisesByMuscleGroup(this.bodyPart);
}

@lazySingleton
class GetAvailableExercisesByMuscleGroupHandler
    extends IRequestHandler<List<ExerciseInfo>, GetAvailableExercisesByMuscleGroup> {
  final ExerciseRepo _exerciseRepo;

  GetAvailableExercisesByMuscleGroupHandler(this._exerciseRepo);
  @override
  Future<List<ExerciseInfo>> call(GetAvailableExercisesByMuscleGroup request) async {
    final availableExercises = await _exerciseRepo.getAvailableExercises();
    final List<ExerciseInfo> exercisesForSpecificMuscle = [];

    for (final exercise in availableExercises) {
      if (exercise.bodyPart.name == request.bodyPart.toLowerCase()) {
        exercisesForSpecificMuscle.add(exercise);
      }
    }

    return exercisesForSpecificMuscle;
  }
}
