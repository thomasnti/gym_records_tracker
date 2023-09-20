import 'package:equatable/equatable.dart';

class ExerciseSet extends Equatable {
  final double kilos;
  final int repetitions;
  final int setNumber;

  const ExerciseSet({
    required this.setNumber,
    this.kilos = 0,
    this.repetitions = 0,
  });

  ExerciseSet copyWith({
    double? kilos,
    int? repetitions,
    int? setNumber,
  }) =>
      ExerciseSet(
        setNumber: setNumber ?? this.setNumber,
        repetitions: repetitions ?? this.repetitions,
        kilos: kilos ?? this.kilos,
      );

  @override
  List<Object?> get props => [kilos, repetitions, setNumber];
}
