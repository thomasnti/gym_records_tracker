import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/exercise_set.dart';
import '../bloc/exercise/cubit/exercise_cubit.dart';
import '../bloc/workout/workout_bloc.dart';

class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;
  final int exerciseIndex;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  ExerciseSetWidget({
    required this.exerciseSet,
    required this.exerciseIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final curWorkoutId = context.read<WorkoutBloc>().state.workoutKey;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(width: 1, color: Theme.of(context).primaryColor)),
              child: Center(
                child: Text(
                  exerciseSet.setNumber.toString(),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context.read<ExerciseCubit>().onWeightChanged(
                        value,
                        exerciseSet.setNumber,
                        curWorkoutId,
                        exerciseIndex,
                      );
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: repsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Reps',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context.read<ExerciseCubit>().onRepsChanged(
                        value,
                        exerciseSet.setNumber,
                        curWorkoutId,
                        exerciseIndex,
                      );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy_rounded,
                              size: 30,
                            ),
                            label: const Text(
                              'Copy Set',
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            label: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
