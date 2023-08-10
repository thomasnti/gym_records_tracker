import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../domain/date_time_service.dart';
import '../extension_methods.dart';

@LazySingleton(as: DateTimeService)
class DateTimeServiceImpl extends DateTimeService {
  @override
  String getHourMinuteFromDt(DateTime dateTime) {
    final date =
        '${dateTime.hour.asTwoDigitString()}:${dateTime.minute.asTwoDigitString()}';

    return date;
  }

  @override
  String formatToMonthNameDay(DateTime dateTime) {
    final String monthName = DateFormat('MMM').format(dateTime);
    final String day = dateTime.day.toString();

    return '$monthName $day';
  }

  @override
  String formatToFullDateWithDayName(DateTime dateTime) {
    final String formattedDate = DateFormat('E, d MMM yyyy').format(dateTime);

    return formattedDate;
  }
}
