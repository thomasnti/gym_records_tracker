import 'package:flutter/material.dart';

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
              builder: (context) => const AddWorkoutPage(),
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
