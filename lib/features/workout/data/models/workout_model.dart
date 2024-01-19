import 'package:json_annotation/json_annotation.dart';

part 'workout_model.g.dart';

@JsonSerializable()
class WorkoutModel {
  final int id;
  @JsonKey(name: 'WORKOUT_DATE')
  final String workoutDate;
  @JsonKey(name: 'START_TIME')
  final String startTime;
  @JsonKey(name: 'END_TIME', defaultValue: '')
  final String endTime;
  @JsonKey(name: 'EXERCISES')
  final String exercises;

  WorkoutModel({
    required this.id,
    required this.workoutDate,
    required this.startTime,
    required this.endTime,
    required this.exercises,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => _$WorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);
}
