// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
      id: json['id'] as int,
      workoutDate: json['WORKOUT_DATE'] as String,
      startTime: json['START_TIME'] as String,
      endTime: json['END_TIME'] as String? ?? '',
      exercises: json['EXERCISES'] as String,
    );

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'WORKOUT_DATE': instance.workoutDate,
      'START_TIME': instance.startTime,
      'END_TIME': instance.endTime,
      'EXERCISES': instance.exercises,
    };
