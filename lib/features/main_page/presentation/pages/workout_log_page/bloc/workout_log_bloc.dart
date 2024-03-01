import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../../workout/domain/entities/workout.dart';
import '../../../../domain/usecases/get_saved_workouts_query.dart';

part 'workout_log_event.dart';
part 'workout_log_state.dart';

@injectable
class WorkoutLogBloc extends Bloc<WorkoutLogEvent, WorkoutLogState> {
  final Mediator _mediator;

  WorkoutLogBloc(this._mediator)
      : super(
          const WorkoutLogState(),
        ) {
    _registerEvents();
  }

  void _registerEvents() {
    on<GetSavedWorkoutsEvent>(_onGetSavedWorkoutsEvent);
  }

  Future<FutureOr<void>> _onGetSavedWorkoutsEvent(
    GetSavedWorkoutsEvent event,
    Emitter<WorkoutLogState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    final workouts = await _mediator.send<List<Workout>, GetSavedWorkoutsQuery>(
      GetSavedWorkoutsQuery(),
    );

    emit(state.copyWith(
      loading: false,
      workouts: workouts,
    ));
  }
}
