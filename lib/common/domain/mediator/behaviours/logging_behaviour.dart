import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../services/log_service.dart';

@lazySingleton
class LoggingBehaviour extends IPipelineBehaviour {
  final LogService _logService;

  LoggingBehaviour(this._logService);
  @override
  Future proccess(IRequest request, RequestHandlerDelegate next) {
    return next(request)
      ..then(
        (res) {
          _logService
            ..log('${request.runtimeType} - $request', eventName: 'UseCase_Called')
            ..log('$res', eventName: 'UseCase_Result');
        },
      );
  }
}
