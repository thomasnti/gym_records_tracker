import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/exercise_info.dart';
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
          ),
        ),
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
            trailing: IconButton(
              icon: const Icon(Icons.info),
              splashColor: Colors.transparent,
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext ctx) => ExerciseInfoDialog(
                  exerciseInfo: exercise,
                ),
              ),
            ),
            onTap: isFromWorkout
                ? () {
                    Navigator.of(context).pop();
                    context.read<WorkoutBloc>().add(AddExerciseToWorkoutEvent(exercise.name));
                    // Navigator.of(context).pop();
                  }
                : null,
          ),
        );
      },
    );
  }
}

class ExerciseInfoDialog extends StatelessWidget {
  final ExerciseInfo? exerciseInfo;

  const ExerciseInfoDialog({
    required this.exerciseInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (exerciseInfo == null) {
      return const Dialog(
        child: Text('Exercise info could not be found for this exercise'),
      );
    }
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(exerciseInfo!.fullGifPath),
              const SizedBox(height: 20),
              Column(
                  children: exerciseInfo!.instructions
                      .asMap()
                      .entries
                      .map((el) => Text('${el.key + 1}. ${el.value}'))
                      .toList()),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
