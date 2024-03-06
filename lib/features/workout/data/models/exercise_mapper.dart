import 'dart:convert';
import 'dart:developer';

import '../../../../common/extension_methods.dart';
import '../../domain/entities/exercise.dart';

List<Exercise> mapExercises(String exercises) {
  final result = <Exercise>[];
  log(exercises);

  final List decodedExercises = json.decode(exercises.removeLastCommaFromJson());

  for (final decodedExercise in decodedExercises) {
    result.add(Exercise.fromMap(decodedExercise));
  }

  return result;
}
