import 'package:equatable/equatable.dart';

import 'exercise_set.dart';

/// Represents an exercise with various properties such as the exercise name,
/// number of sets, number of repetitions, weight in kilograms, and body parts
/// targeted by the exercise.
class Exercise extends Equatable {
  /// The name of the exercise.
  final String exerciseName;

  final List<ExerciseSet> exerciseSets;

  /// Creates a new instance of the [Exercise] class.
  const Exercise({
    required this.exerciseName,
    this.exerciseSets = const [],
  });

  Exercise copyWith({
    String? exerciseName,
    List<ExerciseSet>? exerciseSets,
  }) =>
      Exercise(
        exerciseName: exerciseName ?? this.exerciseName,
        exerciseSets: exerciseSets ?? this.exerciseSets,
      );

  @override
  List<Object?> get props => [
        exerciseName,
        exerciseSets,
      ];
}
