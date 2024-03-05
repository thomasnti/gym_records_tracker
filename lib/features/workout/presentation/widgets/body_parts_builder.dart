import 'package:flutter/material.dart';

import '../../../../common/extension_methods.dart';
import '../../../../dependency_injection/dependency_injection.dart';
import '../../domain/entities/body_parts.dart';
import '../bloc/exercise/cubit/exercise_cubit.dart';
import '../pages/exercises_page.dart';
import 'body_parts_builder_tile.dart';

class BodyPartsBuilder extends StatelessWidget {
  final List<BodyParts> bodyParts;
  final bool isFromWorkout;

  const BodyPartsBuilder({
    required this.bodyParts,
    required this.isFromWorkout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bodyParts.length,
      itemBuilder: (context, index) {
        final bodyPart = bodyParts[index];
        final bodyPartName = bodyPart.name.capitalizeFirstLetter();

        return BodyPartsBuilderTile(
          bodyPartName: bodyPartName,
          onBodyPartTap: () => onMuscleGroupTap(context, bodyPartName),
        );
      },
    );
  }

  Future<void> onMuscleGroupTap(BuildContext context, String bodyPartName) async {
    final exercises = await getIt<ExerciseCubit>().getAvailableExercises(bodyPartName);

    // ignore: use_build_context_synchronously
    await Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => ExercisesPage(
          bodyPart: bodyPartName,
          bodyPartAvailableExercises: exercises,
          isFromWorkout: isFromWorkout,
        ),
      ),
    );
  }
}
