import 'package:flutter/material.dart';

import '../../domain/entities/body_parts.dart';
import '../widgets/body_parts_builder.dart';

// maybe rename to -> AvailableExercisesPage
class BodyPartsPage extends StatelessWidget {
  /// If it is true, it means that the user creates a new workout
  final bool isFromWorkout;

  const BodyPartsPage({
    this.isFromWorkout = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<BodyParts> bodyParts = BodyParts.values;

    return BodyPartsBuilder(
      bodyParts: bodyParts,
      isFromWorkout: isFromWorkout,
    );
  }
}
