import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../common/presentation/widgets/add_workout_button.dart';
import '../../../../../dependency_injection/dependency_injection.dart';
import '../../../../workout/domain/entities/workout.dart';
import '../../../../workout/presentation/bloc/workout/workout_bloc.dart';
import '../../cubit/main_page_cubit.dart';
import 'bloc/workout_log_bloc.dart';

class WorkoutLogPage extends StatelessWidget {
  const WorkoutLogPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (context) => getIt<WorkoutLogBloc>()
            ..add(
              GetSavedWorkoutsEvent(),
            ),
          lazy: false,
          child: BlocListener<WorkoutBloc, WorkoutState>(
            listener: (context, state) {
              // We listen for WorkoutBloc state changes and when the workout is finished we rebuild the page to show the new exercise.
              if (state.workoutFinished) {
                context.read<WorkoutLogBloc>().add(GetSavedWorkoutsEvent());
              }
            },
            child: BlocBuilder<WorkoutLogBloc, WorkoutLogState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state.workouts.isEmpty) {
                  return const Center(
                    child: Text(
                      "You have no workouts in your log.  Press 'Begin Workout' to create one.",
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<WorkoutLogBloc>().add(GetSavedWorkoutsEvent());
                  },
                  child: ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
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
                                  BlocBuilder<MainPageCubit, MainPageState>(
                                    // Container won't rebuild when changing theme. So, I put a bloc builder
                                    builder: (context, state) {
                                      return Container(
                                        width: double.infinity, // takes the available space
                                        constraints: const BoxConstraints(minHeight: 60),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.primaryContainer,
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
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    top: 8, // same as padding
                                    right: 8,
                                    child: Text(
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
                    },
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: const AddWorkoutButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  String _displayDuration(Workout workout) {
    final durationInMinutes = workout.durationInMins;

    if (durationInMinutes == null) {
      return '';
    }

    return '$durationInMinutes min';
  }
}
