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
                  shape: BoxShape.circle, border: Border.all(width: 1, color: Theme.of(context).primaryColor)),
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy_rounded,
                              size: 30,
                            ),
                            label: const Text(
                              'Copy Set',
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
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
