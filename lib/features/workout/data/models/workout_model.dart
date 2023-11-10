// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'workout_model.g.dart';

@JsonSerializable()
class WorkoutModel {
  final int id;
  @JsonKey() //! Να το κάνω με JsonKey ωστε να μην εχω αυτο ignore_for_file: non_constant_identifier_names
  final String WORKOUT_DATE;
  final String START_TIME;
  final String END_TIME;
  final String EXERCISES;

  WorkoutModel({
    required this.id,
    required this.WORKOUT_DATE,
    required this.START_TIME,
    required this.END_TIME,
    required this.EXERCISES,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => _$WorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);
}
