import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import 'behaviours/logging_behaviour.dart';
import 'behaviours/performance_behaviour.dart';

// @LazySingleton(as: Pipeline)
@Injectable(as: Pipeline)
class GymRecordsPipeline extends Pipeline {
  final LoggingBehaviour _loggingBehaviour;
  final PerformanceBehaviour _performanceBehaviour;

  GymRecordsPipeline(
    this._loggingBehaviour,
    this._performanceBehaviour,
  ) {
    addMiddleware(_loggingBehaviour);
    addMiddleware(_performanceBehaviour);
  }
}
