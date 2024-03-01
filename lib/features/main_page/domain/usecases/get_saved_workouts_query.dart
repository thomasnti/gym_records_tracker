import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../workout/domain/entities/workout.dart';
import '../../../workout/domain/repositories/workout_repo.dart';

class GetSavedWorkoutsQuery extends IQuery<List<Workout>> {}

@injectable
class GetSavedWorkoutsQueryHandler extends IRequestHandler<List<Workout>, GetSavedWorkoutsQuery> {
  final WorkoutRepo _workoutRepo;

  GetSavedWorkoutsQueryHandler(this._workoutRepo);

  @override
  Future<List<Workout>> call(GetSavedWorkoutsQuery request) async {
    final workouts = await _workoutRepo.getSavedWorkouts();
    return workouts;
  }
}
