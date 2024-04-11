import 'package:intl/intl.dart';

import '../../../../common/domain/entities/full_date_parts.dart';
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

  final FullDateParts? workoutDateParts;

  final int? workoutId;

  /// Creates a new instance of the [Workout] class.
  Workout({
    required this.workoutDate,
    required this.startTime,
    this.endTime,
    this.exercises = const [],
    this.workoutDateParts,
    this.workoutId,
  });

  String? get durationInMins {
    if (endTime == null || endTime!.isEmpty) {
      return null;
    }

    final dateTimeEnd = DateFormat('HH:mm').parse(endTime!);
    final dateTimeStart = DateFormat('HH:mm').parse(startTime);
    final diff = dateTimeEnd.difference(dateTimeStart);
    return diff.inMinutes.toString();
  }

  Workout copyWith({
    String? workoutDate,
    String? startTime,
    String? endTime,
    List<Exercise>? exercises,
    FullDateParts? workoutDateParts,
    int? workoutId,
  }) =>
      Workout(
        workoutDate: workoutDate ?? this.workoutDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        exercises: exercises ?? this.exercises,
        workoutDateParts: workoutDateParts ?? this.workoutDateParts,
        workoutId: workoutId ?? this.workoutId,
      );
}
