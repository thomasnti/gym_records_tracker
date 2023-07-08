import 'body_parts.dart';

/// Represents an exercise with various properties such as the exercise name,
/// number of sets, number of repetitions, weight in kilograms, and body parts
/// targeted by the exercise.
class Exercise {
  /// The name of the exercise.
  final String exerciseName;

  /// The number of sets for the exercise.
  final int sets;

  /// The number of repetitions per set for the exercise.
  final int repetitions;

  /// The weight in kilograms used for the exercise.
  final double kilos;

  /// The body parts targeted by the exercise.
  final BodyParts bodyPart;

  /// Creates a new instance of the [Exercise] class.
  Exercise(
    this.exerciseName,
    this.sets,
    this.repetitions,
    this.kilos,
    this.bodyPart,
  );
}
