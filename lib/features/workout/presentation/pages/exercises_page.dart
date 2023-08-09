import 'package:flutter/material.dart';

import '../../data/exercises_data.dart';

class ExercisesPage extends StatelessWidget {
  final String bodyPart;
  final List<ExerciseInfo> bodyPartAvailableExercises;

  const ExercisesPage({
    required this.bodyPart,
    required this.bodyPartAvailableExercises,
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
            title: Text(exercise.name),
          ),
        );
      },
    );
  }
}
