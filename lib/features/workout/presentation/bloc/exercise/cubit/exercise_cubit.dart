import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../domain/entities/exercise_info.dart';
import '../../../../domain/entities/exercise_set.dart';
import '../../../../domain/usecases/exercise_set_changed.dart';
import '../../../../domain/usecases/get_available_exercises_by_muscle_group.dart';
import '../../../../domain/usecases/get_exercise_info_by_exercise_query.dart';
import '../../workout/workout_bloc.dart';

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

  Future<void> addSet() async {
    //! kalytera na to kanw sto workout bloc
    final newSetNumber = state.exerciseSetNumber + 1;
    final updatedExerciseSets = [...state.exerciseSets, ExerciseSet(setNumber: newSetNumber)];

    emit(
      state.copyWith(
        exerciseSetNumber: newSetNumber,
        exerciseSets: updatedExerciseSets,
      ),
    );
  }

  Future<void> onWeightChanged(
      String newWeight, int setNumber, int? workoutId, int exerciseNum) async {
    // NA VALW DEBOUNCE GIATI O XRHSTHS THA PLHKTROLOGEI GRHGORA
    print(newWeight);
    if (workoutId == null) {
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
    print(newReps);
    if (workoutId == null) {
      return;
    }

    await mediator.send<bool, ExerciseSetChanged>(ExerciseSetChanged(
      double.parse(newReps),
      true,
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

class ExerciseCubitParams {
  final WorkoutBloc workoutBloc;

  ExerciseCubitParams(this.workoutBloc);
}
