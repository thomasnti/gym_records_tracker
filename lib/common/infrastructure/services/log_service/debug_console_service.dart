// ignore_for_file: unused_element

import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';

import '../../../domain/services/log_service.dart';

//? https://www.kindacode.com/article/flutter-how-to-colorize-debug-console-logs
const _reset = '\x1B[0m';
const _black = '\x1B[30m';
const _white = '\x1B[37m';
const _red = '  \x1B[31m';
const _green = '\x1B[32m';
const _yellow = '\x1B[33m';
const _blue = ' \x1B[34m';
const _cyan = ' \x1B[36m';

@LazySingleton(as: LogService)
class DebugConsoleService extends LogService {
  @override
  // maybe instead of strings to create an Enum
  void log(String message, {String eventName = 'Generic_Log'}) {
    if (eventName == 'UseCase_Called') {
      // Mediator Request
      developer.log('$_white Mediator REQUEST --> $message$_reset', name: eventName);
      return;
    }
    if (eventName == 'UseCase_Result') {
      // Mediator Request Result
      developer.log('$_cyan Mediator RESULT --> $message$_reset', name: eventName);
      return;
    }

    if (eventName.contains('QUERY')) {
      developer.log('$_green$message$_reset', name: eventName);
      return;
    }
    if (eventName.contains('HTTP')) {
      return;
    }
    if (eventName.contains('ERROR')) {
      return;
    }

    developer.log('--> $message', name: eventName);
  }
}
