import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../common/domain/services/date_time_service.dart';
import '../entities/workout.dart';
import '../repositories/workout_repo.dart';

class BeginWorkoutCommand extends ICommand<int> {}

@lazySingleton
class BeginWorkoutCommandHandler extends IRequestHandler<int, BeginWorkoutCommand> {
  final WorkoutRepo _workoutRepo;
  final DateTimeService _dateTimeService;

  BeginWorkoutCommandHandler(this._workoutRepo, this._dateTimeService);
  @override
  Future<int> call(BeginWorkoutCommand request) async {
    final newWorkout = Workout(
      workoutDate: DateTime.now().toString(), // todo Do it with _dateTimeService
      startTime: _dateTimeService.getHourMinuteFromDt(DateTime.now()),
    );

    return _workoutRepo.saveWorkout(newWorkout);
  }
}
