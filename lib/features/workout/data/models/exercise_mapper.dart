import 'dart:convert';

import '../../domain/entities/exercise.dart';

List<Exercise> mapExercises(String exercises) {
  final result = <Exercise>[];
  final List decodedExercises = json.decode(exercises);

  for (final decodedExercise in decodedExercises) {
    result.add(Exercise.fromMap(decodedExercise));
  }

  return result;
}
