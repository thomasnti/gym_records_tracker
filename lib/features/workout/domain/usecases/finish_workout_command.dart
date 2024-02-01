import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../repositories/workout_repo.dart';

class FinishWorkoutCommand extends ICommand<void> {
  final int currentWorkoutId;

  FinishWorkoutCommand(this.currentWorkoutId);
}

@lazySingleton
class FinishWorkoutCommandHandler extends IRequestHandler<void, FinishWorkoutCommand> {
  final WorkoutRepo _workoutRepo;

  FinishWorkoutCommandHandler(this._workoutRepo);
  @override
  Future<void> call(FinishWorkoutCommand request) async {
    final currentWorkout = await _workoutRepo.getCurrentWorkout(request.currentWorkoutId);

    currentWorkout.endTime = DateTime.now().toString();

    unawaited(_workoutRepo.updateWorkout(
      workoutId: request.currentWorkoutId,
      workoutToUpdate: currentWorkout,
    ));
  }
}
