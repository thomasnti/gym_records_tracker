import 'package:gym_records_tracker/features/workout/domain/entities/gym_exercise.dart';

class Workout {
  final List<GymExercise> workout;
  final DateTime workoutDate;

  Workout(this.workout, this.workoutDate);
}
