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
            workoutStarted: false,
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
      Exercise(
          exerciseName: event.selectedExercise, exerciseSets: const [ExerciseSet(setNumber: 1)])
    ];

    emit(
      state.copyWith(
        showBodyParts: false,
        exercises: exercises,
        // exerciseSetNumber: 1,
        // exerciseSets: [ExerciseSet(setNumber: 1)],
      ),
    );
  }

  FutureOr<void> _onAddSetToExercise(
    AddSetToExerciseEvent event,
    Emitter<WorkoutState> emit,
  ) {
    // In Dart, when you assign an object from one variable to another, you're actually creating a reference to the same object in memory. So, if state.exercises[currentExerciseIndex] is a reference to the same object as currentExercise, any changes you make to currentExercise will also affect state.exercises[currentExerciseIndex] because they both point to the same object in memory.

    final currentExerciseIndex =
        state.exercises.indexWhere((exercise) => exercise.exerciseName == event.exerciseName);

    final currentExercise = state.exercises[currentExerciseIndex];
    final currentExerciseSetNum = currentExercise.exerciseSets.length;
    final updatedExercise = currentExercise.copyWith(
      exerciseSets: [
        ...currentExercise.exerciseSets,
        ExerciseSet(setNumber: currentExerciseSetNum + 1),
      ],
    );

    // * It is needed
    state.exercises[currentExerciseIndex] = updatedExercise;

    emit(state.copyWith(
      exerciseSets: updatedExercise.exerciseSets,
    ));
  }
}
