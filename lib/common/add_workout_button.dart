import 'package:flutter/material.dart';

class AddWorkoutButton extends StatelessWidget {
  const AddWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Add a workout',
      child: const Icon(Icons.add),
    );
  }
}
