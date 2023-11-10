import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../repositories/workout_repo.dart';

class FinishWorkoutCommand extends ICommand<void> {}

@lazySingleton
class FinishWorkoutCommandHandler extends IRequestHandler<void, FinishWorkoutCommand> {
  final WorkoutRepo _workoutRepo;

  FinishWorkoutCommandHandler(this._workoutRepo);
  @override
  Future<void> call(FinishWorkoutCommand request) {
    throw UnimplementedError();
  }
}
