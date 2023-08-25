part of 'workout_bloc.dart';

// abstract class WorkoutState extends Equatable {
//   const WorkoutState();

//   @override
//   List<Object?> get props => [];
// }

// class WorkoutStart extends WorkoutState {}

// class WorkoutFinished extends WorkoutState {}

// class WorkoutExerciceAdd extends WorkoutState {}

// class ExerciseSelected extends WorkoutState {
//   final String selectedExercise;

//   const ExerciseSelected(this.selectedExercise);
// }

class WorkoutState extends Equatable {
  final bool workoutStart;
  final bool workoutFinished;
  final bool showBodyParts;
  final List<Exercise> exercises;
  final List<ExerciseSet> exerciseSets;
  final int exerciseSetNumber;
  final String exerciseToAddSetIn;

  const WorkoutState({
    required this.workoutStart,
    required this.workoutFinished,
    required this.showBodyParts,
    this.exercises = const [],
    this.exerciseSets = const [],
    this.exerciseSetNumber = 0,
    this.exerciseToAddSetIn = '',
  });

  WorkoutState copyWith({
    bool? workoutStart,
    bool? workoutFinished,
    bool? showBodyParts,
    String? selectedExercise,
    List<Exercise>? exercises,
    List<ExerciseSet>? exerciseSets,
    int? exerciseSetNumber,
    String? exerciseToAddSetIn,
  }) =>
      WorkoutState(
        workoutStart: workoutStart ?? this.workoutStart,
        workoutFinished: workoutFinished ?? this.workoutFinished,
        showBodyParts: showBodyParts ?? this.showBodyParts,
        exercises: exercises ?? this.exercises,
        exerciseSets: exerciseSets ?? this.exerciseSets,
        exerciseSetNumber: exerciseSetNumber ?? this.exerciseSetNumber,
        exerciseToAddSetIn: exerciseToAddSetIn ?? this.exerciseToAddSetIn,
      );

  @override
  List<Object?> get props => [
        workoutStart,
        workoutFinished,
        showBodyParts,
        exercises,
        exerciseSets,
        exerciseSetNumber,
        exerciseToAddSetIn,
      ];
}
