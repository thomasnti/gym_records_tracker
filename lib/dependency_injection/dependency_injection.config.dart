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

import '../common/domain/mediator/behaviours/logging_behaviour.dart' as _i13;
import '../common/domain/mediator/behaviours/performance_behaviour.dart'
    as _i14;
import '../common/domain/mediator/gym_records_pipeline.dart' as _i15;
import '../common/domain/services/date_time_service.dart' as _i3;
import '../common/domain/services/log_service.dart' as _i11;
import '../common/infrastructure/device/database/i_db.dart' as _i18;
import '../common/infrastructure/device/database/mobile_db.dart' as _i19;
import '../common/infrastructure/services/date_time_service_impl.dart' as _i4;
import '../common/infrastructure/services/log_service/debug_console_service.dart'
    as _i12;
import '../features/main_page/domain/usecases/get_saved_workouts_query.dart'
    as _i31;
import '../features/main_page/presentation/pages/workout_log_page/bloc/workout_log_bloc.dart'
    as _i17;
import '../features/workout/data/repositories/exercise_repo_impl.dart' as _i8;
import '../features/workout/data/repositories/workout_repo_impl.dart' as _i21;
import '../features/workout/domain/repositories/exercise_repo.dart' as _i7;
import '../features/workout/domain/repositories/workout_repo.dart' as _i20;
import '../features/workout/domain/usecases/add_exercise_command.dart' as _i22;
import '../features/workout/domain/usecases/add_set_to_exercise_query.dart'
    as _i23;
import '../features/workout/domain/usecases/begin_workout_command.dart' as _i24;
import '../features/workout/domain/usecases/copy_set_command.dart' as _i25;
import '../features/workout/domain/usecases/delete_exercise_from_workout_command.dart'
    as _i26;
import '../features/workout/domain/usecases/delete_set_command.dart' as _i27;
import '../features/workout/domain/usecases/delete_workout_command.dart'
    as _i28;
import '../features/workout/domain/usecases/exercise_set_changed.dart' as _i29;
import '../features/workout/domain/usecases/finish_workout_command.dart'
    as _i30;
import '../features/workout/domain/usecases/get_available_exercises_by_muscle_group.dart'
    as _i9;
import '../features/workout/domain/usecases/get_exercise_info_by_exercise_query.dart'
    as _i10;
import '../features/workout/presentation/bloc/exercise/cubit/exercise_cubit.dart'
    as _i5;
import '../features/workout/presentation/bloc/workout/workout_bloc.dart'
    as _i16;

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
    gh.factory<_i10.GetExerciseInfoByExerciseQueryHandler>(() =>
        _i10.GetExerciseInfoByExerciseQueryHandler(gh<_i7.ExerciseRepo>()));
    gh.lazySingleton<_i11.LogService>(() => _i12.DebugConsoleService());
    gh.lazySingleton<_i13.LoggingBehaviour>(
        () => _i13.LoggingBehaviour(gh<_i11.LogService>()));
    gh.lazySingleton<_i14.PerformanceBehaviour>(
        () => _i14.PerformanceBehaviour(gh<_i11.LogService>()));
    gh.factory<_i6.Pipeline>(() => _i15.GymRecordsPipeline(
          gh<_i13.LoggingBehaviour>(),
          gh<_i14.PerformanceBehaviour>(),
        ));
    gh.factory<_i16.WorkoutBloc>(() => _i16.WorkoutBloc(gh<_i6.Mediator>()));
    gh.factory<_i17.WorkoutLogBloc>(
        () => _i17.WorkoutLogBloc(gh<_i6.Mediator>()));
    gh.lazySingleton<_i18.IDB>(() => _i19.MobileDb(gh<_i11.LogService>()));
    gh.lazySingleton<_i20.WorkoutRepo>(
        () => _i21.WorkoutRepoImpl(gh<_i18.IDB>()));
    gh.lazySingleton<_i22.AddExerciseCommandHandler>(
        () => _i22.AddExerciseCommandHandler(gh<_i20.WorkoutRepo>()));
    gh.factory<_i23.AddSetToExerciseQueryHandler>(
        () => _i23.AddSetToExerciseQueryHandler(gh<_i20.WorkoutRepo>()));
    gh.lazySingleton<_i24.BeginWorkoutCommandHandler>(
        () => _i24.BeginWorkoutCommandHandler(
              gh<_i20.WorkoutRepo>(),
              gh<_i3.DateTimeService>(),
            ));
    gh.factory<_i25.CopySetCommandHandler>(
        () => _i25.CopySetCommandHandler(gh<_i20.WorkoutRepo>()));
    gh.factory<_i26.DeleteExerciseFromWorkoutCommandHandler>(() =>
        _i26.DeleteExerciseFromWorkoutCommandHandler(gh<_i20.WorkoutRepo>()));
    gh.factory<_i27.DeleteSetCommandHandler>(
        () => _i27.DeleteSetCommandHandler(gh<_i20.WorkoutRepo>()));
    gh.factory<_i28.DeleteWorkoutCommandHandler>(
        () => _i28.DeleteWorkoutCommandHandler(gh<_i20.WorkoutRepo>()));
    gh.factory<_i29.ExerciseSetChangedHandler>(
        () => _i29.ExerciseSetChangedHandler(gh<_i20.WorkoutRepo>()));
    gh.lazySingleton<_i30.FinishWorkoutCommandHandler>(
        () => _i30.FinishWorkoutCommandHandler(gh<_i20.WorkoutRepo>()));
    gh.factory<_i31.GetSavedWorkoutsQueryHandler>(
        () => _i31.GetSavedWorkoutsQueryHandler(
              gh<_i20.WorkoutRepo>(),
              gh<_i3.DateTimeService>(),
            ));
    return this;
  }
}
