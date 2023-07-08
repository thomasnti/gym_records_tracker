import 'exercise.dart';

/// Represents a workout consisting of a list of exercises, workout date, start time, and end time.
class Workout {
  /// The list of exercises performed in the workout.
  final List<Exercise> exercises;

  /// The date of the workout.
  final DateTime workoutDate;

  /// The start time of the workout.
  final DateTime startTime;

  /// The end time of the workout.
  final DateTime endTime;

  /// Creates a new instance of the [Workout] class.
  Workout(
    this.exercises,
    this.workoutDate,
    this.startTime,
    this.endTime,
  );
}
