import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../domain/entities/exercise_info.dart';
import '../../../../domain/entities/exercise_set.dart';
import '../../../../domain/usecases/exercise_set_changed.dart';
import '../../../../domain/usecases/get_available_exercises_by_muscle_group.dart';
import '../../../../domain/usecases/get_exercise_info_by_exercise_query.dart';

part 'exercise_state.dart';

@injectable
class ExerciseCubit extends Cubit<ExerciseState> {
  final Mediator mediator;

  ExerciseCubit(
    this.mediator,
  ) : super(const ExerciseState());

  Future<List<ExerciseInfo>> getAvailableExercises(String bodyPart) async {
    final exercisesOrFailure =
        await mediator.send<List<ExerciseInfo>, GetAvailableExercisesByMuscleGroup>(
            GetAvailableExercisesByMuscleGroup(bodyPart));

    return exercisesOrFailure;
  }

  Future<void> onWeightChanged(
      String newWeight, int setNumber, int? workoutId, int exerciseNum) async {
    //TODO: NA VALW DEBOUNCE GIATI O XRHSTHS THA PLHKTROLOGEI GRHGORA
    if (workoutId == null || newWeight.isEmpty) {
      return;
    }

    await mediator.send<bool, ExerciseSetChanged>(ExerciseSetChanged(
      double.parse(newWeight),
      true,
      setNumber - 1,
      exerciseNum,
      workoutId,
    ));
  }

  Future<void> onRepsChanged(String newReps, int setNumber, int? workoutId, int exerciseNum) async {
    if (workoutId == null || newReps.isEmpty) {
      return;
    }

    await mediator.send<bool, ExerciseSetChanged>(ExerciseSetChanged(
      double.parse(newReps),
      false, // weight changed false
      setNumber - 1,
      exerciseNum,
      workoutId,
    ));
  }

  Future<ExerciseInfo?> getExerciseInfo(String exerciseName) async {
    final exerciceInfo = await mediator.send<ExerciseInfo?, GetExerciseInfoByExerciseQuery>(
      GetExerciseInfoByExerciseQuery(exerciseName),
    );

    return exerciceInfo;
  }
}
