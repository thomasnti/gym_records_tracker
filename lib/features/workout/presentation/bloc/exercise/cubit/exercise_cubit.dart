import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../domain/entities/exercise_info.dart';
import '../../../../domain/usecases/get_available_exercises_by_muscle_group.dart';

part 'exercise_state.dart';

@injectable
class ExerciseCubit extends Cubit<ExerciseState> {
  final Mediator mediator;

  ExerciseCubit(
    this.mediator,
  ) : super(
          ExerciseInitial(),
        );

  // ExerciseCubit({
  //   required this.mediator,
  // }) : super(ExerciseInitial());

  Future<List<ExerciseInfo>> getAvailableExercises(String bodyPart) async {
    final exercisesOrFailure =
        await mediator.send<List<ExerciseInfo>, GetAvailableExercisesByMuscleGroup>(
            GetAvailableExercisesByMuscleGroup(bodyPart));

    return exercisesOrFailure;
  }
}
