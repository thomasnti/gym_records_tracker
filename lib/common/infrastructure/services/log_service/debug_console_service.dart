import 'package:injectable/injectable.dart';

import '../../../domain/services/log_service.dart';

@LazySingleton(as: LogService)
class DebugConsoleService extends LogService {
  @override
  // maybe instead of strings to create an Enum
  void log(String message, {String eventName = ''}) {
    if (eventName == 'UseCase_Called') {
      return;
    }
    if (eventName == 'UseCase_Result') {
      return;
    }

    if (eventName.contains('QUERY')) {
      return;
    }
    if (eventName.contains('HTTP')) {
      return;
    }
    if (eventName.contains('ERROR')) {
      return;
    }
  }
}
