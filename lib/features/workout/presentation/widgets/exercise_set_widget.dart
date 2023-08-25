import 'package:flutter/material.dart';

import '../../domain/entities/exercise_set.dart';

class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExerciseSetWidget({
    required this.exerciseSet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  border: Border.all(
                      width: 1, color: Theme.of(context).primaryColor)),
              child: Center(
                child: Text(
                  exerciseSet.setNumber.toString(),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: TextEditingController(text: '0'),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Reps',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(Icons.more_vert)
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
