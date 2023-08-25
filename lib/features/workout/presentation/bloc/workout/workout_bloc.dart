import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/exercise.dart';
import '../../../domain/entities/exercise_set.dart';

part 'workout_event.dart';
part 'workout_state.dart';

@injectable
class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc()
      : super(
          const WorkoutState(
            workoutStart: false,
            workoutFinished: false,
            showBodyParts: false,
          ),
        ) {
    _registerEvents();
  }

  void _registerEvents() {
    on<SelectBodyPartEvent>(_onSelectBodyPart);
    on<AddExerciseToWorkoutEvent>(_onAddExerciseToWorkoutEvent);
    on<AddSetToExerciseEvent>(_onAddSetToExercise);
  }

  FutureOr<void> _onSelectBodyPart(
    SelectBodyPartEvent event,
    Emitter<WorkoutState> emit,
  ) {
    emit(state.copyWith(
      showBodyParts: true,
    ));
  }

  FutureOr<void> _onAddExerciseToWorkoutEvent(
    AddExerciseToWorkoutEvent event,
    Emitter<WorkoutState> emit,
  ) {
    final exercises = [
      ...state.exercises,
      Exercise(exerciseName: event.selectedExercise)
    ];

    emit(
      state.copyWith(
        showBodyParts: false,
        exercises: exercises,
        exerciseSetNumber: 1,
        exerciseSets: [ExerciseSet(setNumber: 1)],
      ),
    );
  }

  FutureOr<void> _onAddSetToExercise(
    AddSetToExerciseEvent event,
    Emitter<WorkoutState> emit,
  ) {
    if (state.exerciseSets.isNotEmpty) {
      final setNo = state.exerciseSetNumber + 1;
      final exerciseSets = [
        ...state.exerciseSets,
        ExerciseSet(setNumber: setNo)
      ];

      emit(
        state.copyWith(
          exerciseSets: exerciseSets,
          exerciseSetNumber: setNo,
        ),
      );
    }
  }
}
