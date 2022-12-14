import 'package:flutter/material.dart';

class AddWorkoutButton extends StatelessWidget {
  const AddWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
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
