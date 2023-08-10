// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'workout_event.dart';
part 'workout_state.dart';

@injectable
class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutStart()) {
    _registerEvents();
  }

  void _registerEvents() {
    on<AddExerciseToWorkoutEvent>(_onAddExerciseToWorkoutEvent);
    on<ExerciseSelectedEvent>(_onExerciseSelectedEvent);
  }

  FutureOr<void> _onAddExerciseToWorkoutEvent(
    AddExerciseToWorkoutEvent event,
    Emitter<WorkoutState> emit,
  ) {
    emit(WorkoutExerciceAdd());
  }

  FutureOr<void> _onExerciseSelectedEvent(
    ExerciseSelectedEvent event,
    Emitter<WorkoutState> emit,
  ) {
    // print(event.selectedExercise);
    emit(WorkoutFinished());
  }
}
