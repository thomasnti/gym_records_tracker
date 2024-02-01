import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/workout/presentation/bloc/workout/workout_bloc.dart';
import '../../../features/workout/presentation/pages/add_workout_page.dart';

class AddWorkoutButton extends StatelessWidget {
  const AddWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutBloc = context.watch<WorkoutBloc>();
    final workoutState = workoutBloc.state;

    return FloatingActionButton.extended(
      onPressed: () {
        final navigator = Navigator.of(context);

        workoutBloc.add(BeginNewWorkoutEvent());
        navigator.push(
          MaterialPageRoute(
            builder: (_) => const AddWorkoutPage(),
          ),
        );
      },
      tooltip: 'Add a workout',
      label: _WorkoutButtonLabel(workoutState: workoutState),
    );
  }
}

class _WorkoutButtonLabel extends StatelessWidget {
  final WorkoutState workoutState;

  const _WorkoutButtonLabel({
    required this.workoutState,
  });

  @override
  Widget build(BuildContext context) {
    final Icon labelIcon = workoutState.workoutFinished
        ? const Icon(Icons.add)
        : const Icon(Icons.keyboard_arrow_up_rounded);

    return Row(
      children: [
        labelIcon,
        Text(
          workoutState.workoutFinished ? 'Begin workout' : 'Resume workout',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
