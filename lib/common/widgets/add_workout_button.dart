import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection/dependency_injection.dart';
import '../../features/workout/presentation/bloc/workout/workout_bloc.dart';
import '../../features/workout/presentation/pages/add_workout_page.dart';

class AddWorkoutButton extends StatelessWidget {
  const AddWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<WorkoutBloc>(
                create: (context) => getIt<WorkoutBloc>(),
                child: const AddWorkoutPage(),
              ),
            ));
      },
      tooltip: 'Add a workout',
      label: const Row(
        children: [
          Icon(Icons.add),
          Text(
            'Begin workout',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
