import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../entities/exercise_info.dart';
import '../repositories/exercise_repo.dart';

class GetExerciseInfoByExerciseQuery extends IQuery<ExerciseInfo> {
  final String exerciseName;

  GetExerciseInfoByExerciseQuery(this.exerciseName);
}

@injectable
class GetExerciseInfoByExerciseQueryHandler
    extends IRequestHandler<ExerciseInfo?, GetExerciseInfoByExerciseQuery> {
  final ExerciseRepo _exerciseRepo;

  GetExerciseInfoByExerciseQueryHandler(this._exerciseRepo);

  @override
  Future<ExerciseInfo?> call(GetExerciseInfoByExerciseQuery request) async {
    final availableExercises = await _exerciseRepo.getAvailableExercises();

    for (final exerciseInfo in availableExercises) {
      if (exerciseInfo.name == request.exerciseName) {
        return exerciseInfo;
      }
    }

    return null;
  }
}
