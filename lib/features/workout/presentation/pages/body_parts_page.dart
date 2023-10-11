import 'package:flutter/material.dart';

import '../../../../common/extension_methods.dart';
import '../../../../dependency_injection/dependency_injection.dart';
import '../../domain/entities/body_parts.dart';
import '../bloc/exercise/cubit/exercise_cubit.dart';
import 'exercises_page.dart';

class BodyPartsPage extends StatelessWidget {
  final bool isFromWorkout;

  const BodyPartsPage({
    this.isFromWorkout = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<BodyParts> bodyParts = BodyParts.values;

    return ListView.builder(
      itemCount: bodyParts.length,
      itemBuilder: (context, index) {
        final bodyPart = bodyParts[index];
        final bodyPartName = bodyPart.name.capitalizeFirstLetter();

        return DecoratedBox(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: ListTile(
              title: Text(bodyPartName),
              leading: const Icon(Icons.fitness_center),
              onTap: () => onMuscleGroupTap(context, bodyPartName)),
        );
      },
    );
  }

  Future<void> onMuscleGroupTap(
      BuildContext context, String bodyPartName) async {
    final exercises =
        await getIt<ExerciseCubit>().getAvailableExercises(bodyPartName);
    // ignore: unawaited_futures, use_build_context_synchronously
    Navigator.push(
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
