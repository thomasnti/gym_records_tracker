part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class AddExerciseToWorkoutEvent extends WorkoutEvent {}

class ExerciseSelectedEvent extends WorkoutEvent {
  final String selectedExercise;

  const ExerciseSelectedEvent(this.selectedExercise);
}
