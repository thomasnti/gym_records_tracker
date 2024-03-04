import 'package:equatable/equatable.dart';

class ExerciseSet extends Equatable {
  final double kilos;
  final double repetitions; // double because we support half reps
  final int setNumber;

  const ExerciseSet({
    required this.setNumber,
    this.kilos = 0,
    this.repetitions = 0,
  });

  ExerciseSet copyWith({
    double? kilos,
    double? repetitions,
    int? setNumber,
  }) =>
      ExerciseSet(
        setNumber: setNumber ?? this.setNumber,
        repetitions: repetitions ?? this.repetitions,
        kilos: kilos ?? this.kilos,
      );

  @override
  List<Object?> get props => [kilos, repetitions, setNumber];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kilos': kilos,
      'repetitions': repetitions,
      'setNumber': setNumber,
    };
  }

  factory ExerciseSet.fromMap(Map<String, dynamic> map) {
    return ExerciseSet(
      kilos: map['kilos'] as double,
      repetitions: map['repetitions'] as double,
      setNumber: map['setNumber'] as int,
    );
  }
}
