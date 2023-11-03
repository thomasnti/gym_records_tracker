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

import '../common/domain/mediator/behaviours/logging_behaviour.dart' as _i14;
import '../common/domain/mediator/behaviours/performance_behaviour.dart'
    as _i15;
import '../common/domain/mediator/gym_records_pipeline.dart' as _i16;
import '../common/domain/services/date_time_service.dart' as _i3;
import '../common/domain/services/log_service.dart' as _i12;
import '../common/infrastructure/device/database/i_db.dart' as _i10;
import '../common/infrastructure/device/database/mobile_db.dart' as _i11;
import '../common/infrastructure/services/date_time_service_impl.dart' as _i4;
import '../common/infrastructure/services/log_service/debug_console_service.dart'
    as _i13;
import '../features/workout/data/repositories/exercise_repo_impl.dart' as _i8;
import '../features/workout/data/repositories/workout_repo_impl.dart' as _i19;
import '../features/workout/domain/repositories/exercise_repo.dart' as _i7;
import '../features/workout/domain/repositories/workout_repo.dart' as _i18;
import '../features/workout/domain/usecases/get_available_exercises_by_muscle_group.dart'
    as _i9;
import '../features/workout/presentation/bloc/exercise/cubit/exercise_cubit.dart'
    as _i5;
import '../features/workout/presentation/bloc/workout/workout_bloc.dart'
    as _i17;

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
    gh.factory<_i9.GetAvailableExercisesByMuscleGroupHandler>(() =>
        _i9.GetAvailableExercisesByMuscleGroupHandler(gh<_i7.ExerciseRepo>()));
    gh.lazySingleton<_i10.IDB>(() => _i11.MobileDb());
    gh.lazySingleton<_i12.LogService>(() => _i13.DebugConsoleService());
    gh.lazySingleton<_i14.LoggingBehaviour>(
        () => _i14.LoggingBehaviour(gh<_i12.LogService>()));
    gh.lazySingleton<_i15.PerformanceBehaviour>(
        () => _i15.PerformanceBehaviour(gh<_i12.LogService>()));
    gh.factory<_i6.Pipeline>(() => _i16.GymRecordsPipeline(
          gh<_i14.LoggingBehaviour>(),
          gh<_i15.PerformanceBehaviour>(),
        ));
    gh.factory<_i17.WorkoutBloc>(() => _i17.WorkoutBloc());
    gh.lazySingleton<_i18.WorkoutRepo>(
        () => _i19.WorkoutRepoImpl(gh<_i10.IDB>()));
    return this;
  }
}
