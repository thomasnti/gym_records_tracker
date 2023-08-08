import 'package:flutter/material.dart';

import '../../../../common/widgets/add_workout_button.dart';

class WorkoutLogPage extends StatelessWidget {
  const WorkoutLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('here you will see previous workouts'),
      ),
      floatingActionButton: AddWorkoutButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
