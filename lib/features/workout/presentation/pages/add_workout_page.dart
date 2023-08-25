// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/domain/date_time_service.dart';
import '../../../../dependency_injection/dependency_injection.dart';
import '../../domain/entities/exercise.dart';
import '../bloc/workout/workout_bloc.dart';
import '../widgets/exercise_set_widget.dart';
import '../widgets/workout_date.dart';
import '../widgets/workout_duration.dart';
import 'body_parts_page.dart';

class AddWorkoutPage extends StatelessWidget {
  const AddWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
                getIt<DateTimeService>().formatToMonthNameDay(DateTime.now())),
          ),
          body: BlocBuilder<WorkoutBloc, WorkoutState>(
            builder: (context, state) {
              if (state.showBodyParts) {
                return BodyPartsPage(
                  isFromWorkout: true,
                );
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      WorkoutDate(),
                      SizedBox(height: 10),
                      WorkoutDuration(),
                      SizedBox(height: 20),
                      if (state.exercises.isNotEmpty)
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.exercises.length,
                          itemBuilder: (context, index) {
                            return buildExerciseColumn(
                                context, state, state.exercises[index]);
                          },
                        )
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: (!state.showBodyParts)
              ? FloatingActionButton.extended(
                  onPressed: () {
                    context.read<WorkoutBloc>().add(SelectBodyPartEvent());
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                )
              : null,
        );
      },
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              exercise.exerciseName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Icon(Icons.more_vert)
            PopupMenuButton(
              itemBuilder: (context) {
                return [PopupMenuItem(child: Text('Copy'))];
              },
            )
          ],
        ),
        SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // primary: false,
          itemCount: state.exerciseSets.length,
          itemBuilder: (context, index) {
            return ExerciseSetWidget(
              exerciseSet: state.exerciseSets[index],
            );
          },
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                context.read<WorkoutBloc>().add(AddSetToExerciseEvent());
              },
              child: Text(
                'Add Set',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ))
      ],
    );
  }
}

  // List<Widget> buildExerciseSets(WorkoutState state) {
  //   if (state.exerciseSets != null) {
  //     return state.exerciseSets!.map((e) {
  //       return ExerciseSetWidget();
  //     }).toList();
  //   }

  //   return [SizedBox.shrink()];
  // }