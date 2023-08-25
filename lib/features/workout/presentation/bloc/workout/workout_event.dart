part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class SelectBodyPartEvent extends WorkoutEvent {}

class AddExerciseToWorkoutEvent extends WorkoutEvent {
  final String selectedExercise;

  const AddExerciseToWorkoutEvent(this.selectedExercise);
}

class AddSetToExerciseEvent extends WorkoutEvent {}
