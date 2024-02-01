part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final bool workoutStarted;
  final bool workoutFinished;
  final bool showBodyParts;
  final List<Exercise> exercises;
  final List<ExerciseSet> exerciseSets;
  final int exerciseSetNumber;
  final String exerciseToAddSetIn;
  final int? workoutKey;

  const WorkoutState({
    this.workoutStarted = false, // Δε το έχω χρησιμοποιήσει μ΄έχρι στιγμής
    this.workoutFinished = true, // The initial value is true in order to set AddWorkoutButton right
    this.showBodyParts = false,
    this.exercises = const [],
    this.exerciseSets = const [],
    this.exerciseSetNumber = 0,
    this.exerciseToAddSetIn = '',
    this.workoutKey,
  });

  WorkoutState copyWith({
    bool? workoutStarted,
    bool? workoutFinished,
    bool? showBodyParts,
    String? selectedExercise,
    List<Exercise>? exercises,
    List<ExerciseSet>? exerciseSets,
    int? exerciseSetNumber,
    String? exerciseToAddSetIn,
    int? workoutKey,
  }) =>
      WorkoutState(
        workoutStarted: workoutStarted ?? this.workoutStarted,
        workoutFinished: workoutFinished ?? this.workoutFinished,
        showBodyParts: showBodyParts ?? this.showBodyParts,
        exercises: exercises ?? this.exercises,
        exerciseSets: exerciseSets ?? this.exerciseSets,
        exerciseSetNumber: exerciseSetNumber ?? this.exerciseSetNumber,
        exerciseToAddSetIn: exerciseToAddSetIn ?? this.exerciseToAddSetIn,
        workoutKey: workoutKey ?? this.workoutKey,
      );

  @override
  List<Object?> get props => [
        workoutStarted,
        workoutFinished,
        showBodyParts,
        exercises,
        exerciseSets,
        exerciseSetNumber,
        exerciseToAddSetIn,
        workoutKey,
      ];
}
