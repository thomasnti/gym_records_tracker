import 'package:flutter/material.dart';
import 'package:gym_records_tracker/features/workout/presentation/pages/add_workout_screen.dart';

class AddWorkoutButton extends StatelessWidget {
  const AddWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddWorkoutScreen(),
            ));
      },
      tooltip: 'Add a workout',
      label: Row(
        children: const [
          Icon(Icons.add),
          Text(
            'Add workout',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
