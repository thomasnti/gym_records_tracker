import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../common/domain/services/date_time_service.dart';
import '../repositories/workout_repo.dart';

class FinishWorkoutCommand extends ICommand<void> {
  final int currentWorkoutId;

  FinishWorkoutCommand(this.currentWorkoutId);
}

@lazySingleton
class FinishWorkoutCommandHandler extends IRequestHandler<void, FinishWorkoutCommand> {
  final WorkoutRepo _workoutRepo;
  final DateTimeService _dateTimeService;

  FinishWorkoutCommandHandler(this._workoutRepo, this._dateTimeService);
  @override
  Future<void> call(FinishWorkoutCommand request) async {
    final currentWorkout = await _workoutRepo.getCurrentWorkout(request.currentWorkoutId);

    currentWorkout.endTime = _dateTimeService.getHourMinuteFromDt(DateTime.now());

    unawaited(_workoutRepo.updateWorkout(
      workoutId: request.currentWorkoutId,
      workoutToFinish: currentWorkout,
      existingWorkoutExercises: currentWorkout.exercises,
    ));
  }
}
