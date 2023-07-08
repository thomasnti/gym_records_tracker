import 'package:flutter/material.dart';

import '../../domain/entities/body_parts.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<BodyParts> bodyParts = BodyParts.values;

    return ListView.builder(
      itemCount: bodyParts.length,
      itemBuilder: (context, index) {
        final bodyPart = bodyParts[index];

        return DecoratedBox(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: ListTile(
            title: Text(bodyPart.name),
            leading: const Icon(Icons.amp_stories_rounded),
          ),
        );
      },
    );
  }
}
