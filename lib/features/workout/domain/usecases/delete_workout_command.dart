import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../repositories/workout_repo.dart';

class DeleteWorkoutCommand extends ICommand<void> {
  final int id;

  DeleteWorkoutCommand(this.id);
}

@injectable
class DeleteWorkoutCommandHandler extends ICommandHandler<DeleteWorkoutCommand> {
  final WorkoutRepo _workoutRepo;

  DeleteWorkoutCommandHandler(this._workoutRepo);

  @override
  Future<void> call(DeleteWorkoutCommand request) async => _workoutRepo.deleteWorkout(request.id);
}
