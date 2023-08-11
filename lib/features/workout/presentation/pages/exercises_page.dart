import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/exercises_data.dart';
import '../bloc/workout/workout_bloc.dart';

class ExercisesPage extends StatelessWidget {
  final String bodyPart;
  final List<ExerciseInfo> bodyPartAvailableExercises;
  final bool isFromWorkout;

  const ExercisesPage({
    required this.bodyPart,
    required this.bodyPartAvailableExercises,
    this.isFromWorkout = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bodyPart),
      ),
      body: buildExercisesPageBody(),
    );
  }

  Widget buildExercisesPageBody() {
    if (bodyPartAvailableExercises.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          'There are no available exercises for this muscle group!',
          textAlign: TextAlign.center,
        )),
      );
    }
    return ListView.builder(
      itemCount: bodyPartAvailableExercises.length,
      itemBuilder: (context, index) {
        final exercise = bodyPartAvailableExercises[index];

        return DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: ListTile(
            onTap: isFromWorkout
                ? () {
                    Navigator.of(context).pop();
                    context
                        .read<WorkoutBloc>()
                        .add(ExerciseSelectedEvent(exercise.name));
                    // Navigator.of(context).pop();
                  }
                : null,
            title: Text(exercise.name),
          ),
        );
      },
    );
  }
}
