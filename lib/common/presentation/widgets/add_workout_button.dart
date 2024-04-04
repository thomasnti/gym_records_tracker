import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/workout/presentation/bloc/workout/workout_bloc.dart';
import '../../../features/workout/presentation/pages/add_workout_page.dart';
import '../theme/app_theme.dart';

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
    final fabColor = Theme.of(context).colorScheme.fabTextColor;
    final Icon labelIcon = workoutState.workoutFinished
        ? Icon(Icons.add, color: fabColor)
        : Icon(Icons.keyboard_arrow_up_rounded, color: fabColor);

    return Row(
      children: [
        labelIcon,
        Text(
          workoutState.workoutFinished ? 'Begin workout' : 'Resume workout',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.fabTextColor,
          ),
        ),
      ],
    );
  }
}
