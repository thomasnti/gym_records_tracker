part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class BeginNewWorkoutEvent extends WorkoutEvent {}

class SelectBodyPartEvent extends WorkoutEvent {}

class AddExerciseToWorkoutEvent extends WorkoutEvent {
  final String selectedExercise;

  const AddExerciseToWorkoutEvent(this.selectedExercise);
}

class AddSetToExerciseEvent extends WorkoutEvent {
  final String exerciseName;
  final int exerciseIndex;

  const AddSetToExerciseEvent(this.exerciseName, this.exerciseIndex);
}

class FinishWorkoutEvent extends WorkoutEvent {}

class DeleteExerciseEvent extends WorkoutEvent {
  final Exercise exercise;

  const DeleteExerciseEvent(this.exercise);
}
