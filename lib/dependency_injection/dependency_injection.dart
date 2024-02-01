import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import 'dependency_injection.config.dart';
import 'register_mediator_handlers.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initDependencies', //'init'
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.initDependencies();
  // it is needed to run after initDependencies
  configureMediator();

  registerMediatorHandlers();
}

void configureMediator() {
  // Returns GymRecordsPipeline
  final pipeline = getIt<Pipeline>();
  // ..addMiddleware(getIt<LoggingBehaviour>())
  // ..addMiddleware(getIt<PerformanceBehaviour>());

  getIt.registerLazySingleton<Mediator>(() => Mediator(pipeline));
}
