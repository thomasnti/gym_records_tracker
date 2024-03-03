import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../common/presentation/widgets/add_workout_button.dart';
import '../../../../../dependency_injection/dependency_injection.dart';
import '../../../../workout/domain/entities/workout.dart';
import 'bloc/workout_log_bloc.dart';

class WorkoutLogPage extends StatelessWidget {
  const WorkoutLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<WorkoutLogBloc>()
          ..add(
            GetSavedWorkoutsEvent(),
          ),
        lazy: false,
        child: BlocBuilder<WorkoutLogBloc, WorkoutLogState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: state.workouts.length,
                itemBuilder: (context, index) {
                  final workout = state.workouts[index];

                  return Row(
                    children: [
                      Column(
                        children: [
                          Text(workout.workoutDateParts!.dayShort),
                          Text(workout.workoutDateParts!.dayOfMonth),
                          Text(workout.workoutDateParts!.monthShort),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.3,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                label: 'Delete',
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                onPressed: (ctx) => ctx
                                    .read<WorkoutLogBloc>()
                                    .add(DeleteWorkoutEvent(workout.workoutId)),
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                // alignment: Alignment.centerLeft,
                                width: double.infinity, // takes the available space
                                constraints: const BoxConstraints(minHeight: 60),
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: workout.exercises
                                        .map(
                                          (e) => Text(
                                            '${e.exerciseSets.length}x  ${e.exerciseName}',
                                          ),
                                        )
                                        .toList(),
                                    // children: [
                                    //   Text('2x Upright Rows'),
                                    //   Text('2x Bicep curls'),
                                    //   Text('2x Upright Rows'),
                                    //   Text('2x Upright Rows'),
                                    // ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8, // same as padding
                                right: 8,
                                child: Text(
                                  // '55 min',
                                  _displayDuration(workout),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                  // return Column(
                  //   children: [
                  //     Text(state.workouts[index].workoutDate),
                  //     const SizedBox(height: 20),
                  //   ],
                  // );
                },
              ),
            );
            // return const Center(
            //   child: Text('here you will see previous workouts'),
            // );
          },
        ),
      ),
      floatingActionButton: const AddWorkoutButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  String _displayDuration(Workout workout) {
    final durationInMinutes = workout.durationInMins;

    if (durationInMinutes == null) {
      return '';
    }

    return '$durationInMinutes min';
  }
}
