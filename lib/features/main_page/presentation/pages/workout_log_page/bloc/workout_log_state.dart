part of 'workout_log_bloc.dart';

class WorkoutLogState extends Equatable {
  final List<Workout> workouts;
  final bool loading;

  const WorkoutLogState({
    this.workouts = const [],
    this.loading = false,
  });

  WorkoutLogState copyWith({
    List<Workout>? workouts,
    bool? loading,
  }) =>
      WorkoutLogState(
        workouts: workouts ?? this.workouts,
        loading: loading ?? this.loading,
      );

  @override
  List<Object> get props => [
        workouts,
        loading,
      ];
}
