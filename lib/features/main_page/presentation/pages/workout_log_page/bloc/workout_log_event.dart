part of 'workout_log_bloc.dart';

class WorkoutLogEvent extends Equatable {
  const WorkoutLogEvent();

  @override
  List<Object> get props => [];
}

class GetSavedWorkoutsEvent extends WorkoutLogEvent {}

class DeleteWorkoutEvent extends WorkoutLogEvent {
  final int? workoutId;

  const DeleteWorkoutEvent(this.workoutId);
}
