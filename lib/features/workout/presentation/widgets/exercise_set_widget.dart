import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extension_methods.dart';
import '../../domain/entities/exercise_set.dart';
import '../bloc/exercise/cubit/exercise_cubit.dart';
import '../bloc/workout/workout_bloc.dart';

class ExerciseSetWidget extends StatefulWidget {
  final ExerciseSet exerciseSet;
  final int exerciseIndex;
  final int setIndex;

  const ExerciseSetWidget({
    required this.exerciseSet,
    required this.exerciseIndex,
    required this.setIndex,
    super.key,
  });

  @override
  State<ExerciseSetWidget> createState() => _ExerciseSetWidgetState();
}

class _ExerciseSetWidgetState extends State<ExerciseSetWidget> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  @override
  void initState() {
    weightController.text = widget.exerciseSet.kilos.toStringWithoutTrailingZeroes();
    repsController.text = widget.exerciseSet.repetitions.toStringWithoutTrailingZeroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutBloc>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Theme.of(context).primaryColor)),
              child: Center(
                child: Text(
                  widget.exerciseSet.setNumber.toString(),
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
                        widget.exerciseSet.setNumber,
                        bloc.state.workoutKey,
                        widget.exerciseIndex,
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
                        widget.exerciseSet.setNumber,
                        bloc.state.workoutKey,
                        widget.exerciseIndex,
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
                            onPressed: () {
                              bloc.add(CopySetEvent(
                                widget.exerciseIndex,
                                widget.setIndex,
                              ));
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.copy_rounded,
                              size: 30,
                            ),
                            label: const Text(
                              'Copy Set',
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              bloc.add(DeleteSetEvent(
                                widget.exerciseIndex,
                                widget.setIndex,
                              ));
                              Navigator.of(context).pop();
                            },
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
