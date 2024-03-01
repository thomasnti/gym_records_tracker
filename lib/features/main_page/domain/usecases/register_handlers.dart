import 'package:get_it/get_it.dart';
import 'package:mediatr/mediatr.dart';

import '../../../workout/domain/entities/workout.dart';
import 'get_saved_workouts_query.dart';

void registerMainPageHandlers() {
  GetIt.I<Mediator>()
      .registerHandler<List<Workout>, GetSavedWorkoutsQuery, GetSavedWorkoutsQueryHandler>(
    () => GetIt.I<GetSavedWorkoutsQueryHandler>(),
  );
}
