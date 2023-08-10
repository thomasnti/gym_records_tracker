// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/domain/date_time_service.dart';
import '../../../../dependency_injection/dependency_injection.dart';
import '../bloc/workout/workout_bloc.dart';
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
              if (state is WorkoutExerciceAdd) {
                return BodyPartsPage(
                  isFromWorkout: true,
                );
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(
                                text: getIt<DateTimeService>()
                                    .formatToFullDateWithDayName(
                                        DateTime.now())),
                            decoration: InputDecoration(
                              labelText: 'Workout Date',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(
                                text: getIt<DateTimeService>()
                                    .getHourMinuteFromDt(DateTime.now())),
                            decoration: InputDecoration(
                              labelText: 'Start Time',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'End Time',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: (state is! WorkoutExerciceAdd)
              ? FloatingActionButton.extended(
                  onPressed: () {
                    context
                        .read<WorkoutBloc>()
                        .add(AddExerciseToWorkoutEvent());
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
}
