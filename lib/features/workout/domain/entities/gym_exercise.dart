import 'package:equatable/equatable.dart';

// class GymExercise extends Equatable {

// }

class GymExercise {
  final String exerciseName;
  final int sets;
  final int repetitions;
  final double kilos;

  GymExercise(
    this.exerciseName,
    this.sets,
    this.repetitions,
    this.kilos,
  );
}
