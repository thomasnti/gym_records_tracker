import 'package:flutter/material.dart';

class BodyPartsBuilderTile extends StatelessWidget {
  final String bodyPartName;
  final VoidCallback onBodyPartTap;

  const BodyPartsBuilderTile({
    required this.bodyPartName,
    required this.onBodyPartTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: ListTile(
        title: Text(bodyPartName),
        leading: const Icon(Icons.fitness_center),
        onTap: onBodyPartTap,
      ),
    );
  }
}
