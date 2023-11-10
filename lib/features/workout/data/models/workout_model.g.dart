// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
      id: json['id'] as int,
      WORKOUT_DATE: json['WORKOUT_DATE'] as String,
      START_TIME: json['START_TIME'] as String,
      END_TIME: json['END_TIME'] as String,
      EXERCISES: json['EXERCISES'] as String,
    );

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'WORKOUT_DATE': instance.WORKOUT_DATE,
      'START_TIME': instance.START_TIME,
      'END_TIME': instance.END_TIME,
      'EXERCISES': instance.EXERCISES,
    };
