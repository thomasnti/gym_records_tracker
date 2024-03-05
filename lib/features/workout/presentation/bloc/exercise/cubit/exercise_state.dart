part of 'exercise_cubit.dart';

class ExerciseState extends Equatable {
  final List<ExerciseSet> exerciseSets;
  final int exerciseSetNumber;

  const ExerciseState({
    this.exerciseSets = const [],
    this.exerciseSetNumber = 0,
  });

  ExerciseState copyWith({
    List<ExerciseSet>? exerciseSets,
    int? exerciseSetNumber,
  }) =>
      ExerciseState(
        exerciseSets: exerciseSets ?? this.exerciseSets,
        exerciseSetNumber: exerciseSetNumber ?? this.exerciseSetNumber,
      );

  @override
  List<Object?> get props => [
        exerciseSets,
        exerciseSetNumber,
      ];
}
