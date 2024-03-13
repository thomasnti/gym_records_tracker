import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/domain/services/date_time_service.dart';
import '../../../../dependency_injection/dependency_injection.dart';
import '../../domain/entities/exercise.dart';
import '../bloc/exercise/cubit/exercise_cubit.dart';
import '../bloc/workout/workout_bloc.dart';
import '../widgets/exercise_set_widget.dart';
import '../widgets/workout_date.dart';
import '../widgets/workout_duration.dart';
import 'body_parts_page.dart';
import 'exercises_page.dart';

//? Η καλύτερη λύση ειναι να εχω ενα bloc για ολο το workout (WorkoutBloc) και αλλο ενα για την κάθε άσκηση ξεχωριστά (ExerciseBloc ΄ή Cubit). Αυτό για να γίνει καλό θα είναι όταν ξεκιναω την άσκηση να γράφεται στη βαση μια νέα εγγραφή και κάθε φορά που αλλάζω κάτι να πάει και να κάνει update και να γυρνάει τα νέα data. Ουσιαστικά το delete workout θα διαγράφει ολόκληρη γραμμη απο την βαση και το delete set ή delete exercise θα κάνει update . Λογικά ολα τα exercise θα μπαινουν σε ενα array of objects και καπως θα κάνω manipulate αυτο.

class AddWorkoutPage extends StatelessWidget {
  const AddWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExerciseCubit>(),
      child: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(getIt<DateTimeService>().formatToMonthNameDay(DateTime.now())),
              leading: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                TextButton(
                  child: const Text(
                    'Finish',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    context.read<WorkoutBloc>().add(
                          FinishWorkoutEvent(),
                        );
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            body: BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                if (state.showBodyParts) {
                  return const BodyPartsPage(
                    isFromWorkout: true,
                  );
                }
                return const NewWorkoutBody();
              },
            ),
            floatingActionButton: (!state.showBodyParts) ? const WorkoutFab() : null,
          );
        },
      ),
    );
  }
}

class WorkoutFab extends StatelessWidget {
  const WorkoutFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<WorkoutBloc>().add(SelectBodyPartEvent());
      },
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      label: const Row(
        children: [
          Icon(Icons.add),
          SizedBox(
            width: 10,
          ),
          Text(
            'Add Exercise',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class NewWorkoutBody extends StatelessWidget {
  const NewWorkoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const WorkoutDate(),
            const SizedBox(height: 10),
            const WorkoutDuration(),
            const SizedBox(height: 20),
            // if (state.exercises.isNotEmpty)
            BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.exercises.length,
                  itemBuilder: (context, index) {
                    return buildExerciseColumn(context, state, state.exercises[index],
                        index); // todo: remove state.exercises[index]
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildExerciseColumn(
    BuildContext context,
    WorkoutState state,
    Exercise exercise,
    int exerciseIndex,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ExerciseTitleAndOptions(exercise: exercise),
        const SizedBox(height: 20),
        BlocBuilder<ExerciseCubit, ExerciseState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // primary: false,
              itemCount: exercise.exerciseSets.length,
              itemBuilder: (context, index) {
                return ExerciseSetWidget(
                  exerciseSet: exercise.exerciseSets[index],
                  exerciseIndex: index,
                  //? this adds sets to all exercises
                  // exerciseSet: state.exerciseSets[index],
                );
              },
            );
          },
        ),
        AddSetButton(
          exerciseName: exercise.exerciseName,
          exerciseIndex: exerciseIndex,
        )
      ],
    );
  }
}

class AddSetButton extends StatelessWidget {
  final String exerciseName;
  final int exerciseIndex;

  const AddSetButton({
    required this.exerciseName,
    required this.exerciseIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            context.read<WorkoutBloc>().add(AddSetToExerciseEvent(exerciseName, exerciseIndex));
          },
          child: Text(
            'Add Set',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ));
  }
}

class ExerciseTitleAndOptions extends StatelessWidget {
  final Exercise exercise;

  const ExerciseTitleAndOptions({
    required this.exercise,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final exerciseCubit = context.read<ExerciseCubit>();
    final workoutBloc = context.read<WorkoutBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            exercise.exerciseName,
            style: Theme.of(context).textTheme.titleLarge,
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
                        onPressed: () async {
                          final info = await exerciseCubit.getExerciseInfo(exercise.exerciseName);

                          await showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) => ExerciseInfoDialog(
                              exerciseInfo: info,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          size: 30,
                        ),
                        label: const Text(
                          'Exercise Details',
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          workoutBloc.add(DeleteExerciseEvent(exercise));
                          Navigator.of(context).pop(); //? close bottom sheet
                        },
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
    );
  }
}
