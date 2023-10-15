import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../services/log_service.dart';

@lazySingleton
class PerformanceBehaviour extends IPipelineBehaviour {
  final LogService _logService;

  PerformanceBehaviour(this._logService);
  @override
  Future proccess(IRequest request, RequestHandlerDelegate next) async {
    final stopWatch = Stopwatch();
    final future = next(request);

    stopWatch.start();
    // unawaited because I want my code to by synchronous when measuring performance
    unawaited(
      future.then(
        (res) {
          stopWatch.stop();
          if (stopWatch.elapsedMilliseconds > 500) {
            _logService.log(
                'Long running request :${request.runtimeType} \n Time Passed :${stopWatch.elapsedMilliseconds} ms \n $request',
                eventName: 'Long_running_request');
          }
        },
      ),
    );
    // ! Important: We need to return the next request because it will return null and the code will crash
    return future;
  }
}
