import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/presentation/widgets/add_workout_button.dart';
import '../../../../../dependency_injection/dependency_injection.dart';
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
              return const CircularProgressIndicator();
            }

            return ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: state.workouts.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(state.workouts[index].workoutDate),
                    const SizedBox(height: 20),
                  ],
                );
              },
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
}
