// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mediatr/mediatr.dart' as _i6;

import '../common/domain/mediator/behaviours/logging_behaviour.dart' as _i12;
import '../common/domain/mediator/behaviours/performance_behaviour.dart'
    as _i13;
import '../common/domain/mediator/gym_records_pipeline.dart' as _i14;
import '../common/domain/services/date_time_service.dart' as _i3;
import '../common/domain/services/log_service.dart' as _i10;
import '../common/infrastructure/device/database/i_db.dart' as _i17;
import '../common/infrastructure/device/database/mobile_db.dart' as _i18;
import '../common/infrastructure/services/date_time_service_impl.dart' as _i4;
import '../common/infrastructure/services/log_service/debug_console_service.dart'
    as _i11;
import '../features/main_page/domain/usecases/get_saved_workouts_query.dart'
    as _i26;
import '../features/main_page/presentation/pages/workout_log_page/bloc/workout_log_bloc.dart'
    as _i16;
import '../features/workout/data/repositories/exercise_repo_impl.dart' as _i8;
import '../features/workout/data/repositories/workout_repo_impl.dart' as _i20;
import '../features/workout/domain/repositories/exercise_repo.dart' as _i7;
import '../features/workout/domain/repositories/workout_repo.dart' as _i19;
import '../features/workout/domain/usecases/add_exercise_command.dart' as _i21;
import '../features/workout/domain/usecases/begin_workout_command.dart' as _i22;
import '../features/workout/domain/usecases/delete_workout_command.dart'
    as _i23;
import '../features/workout/domain/usecases/exercise_set_changed.dart' as _i24;
import '../features/workout/domain/usecases/finish_workout_command.dart'
    as _i25;
import '../features/workout/domain/usecases/get_available_exercises_by_muscle_group.dart'
    as _i9;
import '../features/workout/presentation/bloc/exercise/cubit/exercise_cubit.dart'
    as _i5;
import '../features/workout/presentation/bloc/workout/workout_bloc.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initDependencies({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DateTimeService>(() => _i4.DateTimeServiceImpl());
    gh.factory<_i5.ExerciseCubit>(() => _i5.ExerciseCubit(gh<_i6.Mediator>()));
    gh.lazySingleton<_i7.ExerciseRepo>(() => _i8.ExerciseRepoImpl());
    gh.lazySingleton<_i9.GetAvailableExercisesByMuscleGroupHandler>(() =>
        _i9.GetAvailableExercisesByMuscleGroupHandler(gh<_i7.ExerciseRepo>()));
    gh.lazySingleton<_i10.LogService>(() => _i11.DebugConsoleService());
    gh.lazySingleton<_i12.LoggingBehaviour>(
        () => _i12.LoggingBehaviour(gh<_i10.LogService>()));
    gh.lazySingleton<_i13.PerformanceBehaviour>(
        () => _i13.PerformanceBehaviour(gh<_i10.LogService>()));
    gh.factory<_i6.Pipeline>(() => _i14.GymRecordsPipeline(
          gh<_i12.LoggingBehaviour>(),
          gh<_i13.PerformanceBehaviour>(),
        ));
    gh.factory<_i15.WorkoutBloc>(() => _i15.WorkoutBloc(gh<_i6.Mediator>()));
    gh.factory<_i16.WorkoutLogBloc>(
        () => _i16.WorkoutLogBloc(gh<_i6.Mediator>()));
    gh.lazySingleton<_i17.IDB>(() => _i18.MobileDb(gh<_i10.LogService>()));
    gh.lazySingleton<_i19.WorkoutRepo>(
        () => _i20.WorkoutRepoImpl(gh<_i17.IDB>()));
    gh.lazySingleton<_i21.AddExerciseCommandHandler>(
        () => _i21.AddExerciseCommandHandler(gh<_i19.WorkoutRepo>()));
    gh.lazySingleton<_i22.BeginWorkoutCommandHandler>(
        () => _i22.BeginWorkoutCommandHandler(
              gh<_i19.WorkoutRepo>(),
              gh<_i3.DateTimeService>(),
            ));
    gh.factory<_i23.DeleteWorkoutCommandHandler>(
        () => _i23.DeleteWorkoutCommandHandler(gh<_i19.WorkoutRepo>()));
    gh.factory<_i24.ExerciseSetChangedHandler>(
        () => _i24.ExerciseSetChangedHandler(gh<_i19.WorkoutRepo>()));
    gh.lazySingleton<_i25.FinishWorkoutCommandHandler>(
        () => _i25.FinishWorkoutCommandHandler(gh<_i19.WorkoutRepo>()));
    gh.factory<_i26.GetSavedWorkoutsQueryHandler>(
        () => _i26.GetSavedWorkoutsQueryHandler(
              gh<_i19.WorkoutRepo>(),
              gh<_i3.DateTimeService>(),
            ));
    return this;
  }
}
