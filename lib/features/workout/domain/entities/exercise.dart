import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exerciseName': exerciseName,
      'exerciseSets': exerciseSets.map((x) => x.toMap()).toList(),
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      exerciseName: map['exerciseName'] as String,
      exerciseSets: List<ExerciseSet>.from(
        (map['exerciseSets'] as List<int>).map<ExerciseSet>(
          (x) => ExerciseSet.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) =>
      Exercise.fromMap(json.decode(source) as Map<String, dynamic>);
}
