import 'exercise.dart';

/// Represents a workout consisting of a list of exercises, workout date, start time, and end time.
class Workout {
  /// The date of the workout.
  final String workoutDate;

  /// The start time of the workout.
  final String startTime;

  /// The end time of the workout.
  String?
      endTime; // not final in order to be set // todo: Search how to set a property of an object in Dart without creating a new instance

  /// The list of exercises performed in the workout.
  final List<Exercise> exercises;

  /// Creates a new instance of the [Workout] class.
  Workout({
    required this.workoutDate,
    required this.startTime,
    this.endTime,
    this.exercises = const [],
  });
}
