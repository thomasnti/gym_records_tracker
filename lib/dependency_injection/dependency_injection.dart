import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../features/workout/domain/usecases/register_handlers.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initDependencies', //'init'
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt
    ..registerLazySingleton<Mediator>(
      () => Mediator(Pipeline()),
    )
    ..initDependencies();

  registerWorkoutHandlers();
}
