// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
            ),
            body: BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                if (state.showBodyParts) {
                  return BodyPartsPage(
                    isFromWorkout: true,
                  );
                }
                return NewWorkoutBody();
              },
            ),
            floatingActionButton: (!state.showBodyParts) ? WorkoutFab() : null,
          );
        },
      ),
    );
  }

  // Widget buildExerciseColumn(
  //   BuildContext context,
  //   WorkoutState state,
  //   Exercise exercise,
  // ) {
  //   // print('buildExerciseColumn');
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Flexible(
  //             child: Text(
  //               exercise.exerciseName,
  //               style: Theme.of(context).textTheme.titleLarge,
  //             ),
  //           ),
  //           IconButton(
  //             icon: Icon(Icons.more_vert),
  //             onPressed: () {
  //               showModalBottomSheet(
  //                 context: context,
  //                 builder: (context) {
  //                   return IntrinsicHeight(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         TextButton.icon(
  //                           onPressed: () {},
  //                           icon: Icon(
  //                             Icons.info_outline,
  //                             size: 30,
  //                           ),
  //                           label: Text(
  //                             'Exercise Details',
  //                           ),
  //                         ),
  //                         TextButton.icon(
  //                           onPressed: () {},
  //                           icon: Icon(
  //                             Icons.delete,
  //                             size: 30,
  //                           ),
  //                           label: Text(
  //                             'Delete',
  //                             style: TextStyle(
  //                               color: Colors.red,
  //                             ),
  //                           ),
  //                           style: ButtonStyle(
  //                             foregroundColor: MaterialStateProperty.all(Colors.red),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   );
  //                 },
  //               );
  //             },
  //           )
  //         ],
  //       ),
  //       SizedBox(height: 20),
  //       ListView.builder(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         // primary: false,
  //         // itemCount: state.exerciseSets.length,
  //         itemCount: exercise.exerciseSets.length,
  //         itemBuilder: (context, index) {
  //           return ExerciseSetWidget(
  //             exerciseSet: exercise.exerciseSets[index],
  //             //? this adds sets to all exercises
  //             // exerciseSet: state.exerciseSets[index],
  //           );
  //         },
  //       ),
  //       Align(
  //           alignment: Alignment.centerLeft,
  //           child: TextButton(
  //             onPressed: () {
  //               context.read<WorkoutBloc>().add(AddSetToExerciseEvent(exercise.exerciseName));
  //             },
  //             child: Text(
  //               'Add Set',
  //               style: TextStyle(color: Theme.of(context).primaryColor),
  //             ),
  //           ))
  //     ],
  //   );
  // }
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
            WorkoutDate(),
            SizedBox(height: 10),
            WorkoutDuration(),
            SizedBox(height: 20),
            // if (state.exercises.isNotEmpty)
            BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.exercises.length,
                  itemBuilder: (context, index) {
                    return buildExerciseColumn(context, state, state.exercises[index]);
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
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ExerciseTitleAndOptions(exercise: exercise),
        SizedBox(height: 20),
        BlocBuilder<ExerciseCubit, ExerciseState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // primary: false,
              itemCount: exercise.exerciseSets.length,
              itemBuilder: (context, index) {
                return ExerciseSetWidget(
                  exerciseSet: exercise.exerciseSets[index],
                  //? this adds sets to all exercises
                  // exerciseSet: state.exerciseSets[index],
                );
              },
            );
          },
        ),
        AddSetButton(exerciseName: exercise.exerciseName)
      ],
    );
  }
}

class AddSetButton extends StatelessWidget {
  final String exerciseName;

  const AddSetButton({
    required this.exerciseName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            context.read<WorkoutBloc>().add(AddSetToExerciseEvent(exerciseName));
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
          icon: Icon(Icons.more_vert),
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
                        icon: Icon(
                          Icons.info_outline,
                          size: 30,
                        ),
                        label: Text(
                          'Exercise Details',
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 30,
                        ),
                        label: Text(
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
