// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mediatr/mediatr.dart' as _i4;

import '../common/device/database/i_db.dart' as _i8;
import '../common/device/database/mobile_db.dart' as _i9;
import '../features/workout/data/repositories/exercise_repo_impl.dart' as _i6;
import '../features/workout/domain/repositories/exercise_repo.dart' as _i5;
import '../features/workout/domain/usecases/get_available_exercises_by_muscle_group.dart'
    as _i7;
import '../features/workout/presentation/bloc/exercise/cubit/exercise_cubit.dart'
    as _i3;

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
    gh.factory<_i3.ExerciseCubit>(
        () => _i3.ExerciseCubit(mediator: gh<_i4.Mediator>()));
    gh.lazySingleton<_i5.ExerciseRepo>(() => _i6.ExerciseRepoImpl());
    gh.factory<_i7.GetAvailableExercisesByMuscleGroupHandler>(() =>
        _i7.GetAvailableExercisesByMuscleGroupHandler(gh<_i5.ExerciseRepo>()));
    gh.lazySingleton<_i8.IDB>(() => _i9.MobileDb());
    return this;
  }
}
