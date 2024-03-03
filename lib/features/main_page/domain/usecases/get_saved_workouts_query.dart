import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../common/domain/services/date_time_service.dart';
import '../../../workout/domain/entities/workout.dart';
import '../../../workout/domain/repositories/workout_repo.dart';

class GetSavedWorkoutsQuery extends IQuery<List<Workout>> {}

@injectable
class GetSavedWorkoutsQueryHandler extends IRequestHandler<List<Workout>, GetSavedWorkoutsQuery> {
  final WorkoutRepo _workoutRepo;
  final DateTimeService _dateTimeService;

  GetSavedWorkoutsQueryHandler(this._workoutRepo, this._dateTimeService);

  @override
  Future<List<Workout>> call(GetSavedWorkoutsQuery request) async {
    final workouts = await _workoutRepo.getSavedWorkouts();
    final result = <Workout>[];

    for (final workout in workouts) {
      final fullDateParts = _dateTimeService.getFullDateParts(workout.workoutDate);

      result.add(
        workout.copyWith(workoutDateParts: fullDateParts, endTime: '02:30'),
      );
    }

    return result;
  }
}
