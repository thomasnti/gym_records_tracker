import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/full_date_parts.dart';
import '../../domain/services/date_time_service.dart';
import '../../extension_methods.dart';

@LazySingleton(as: DateTimeService)
class DateTimeServiceImpl extends DateTimeService {
  @override
  String getHourMinuteFromDt(DateTime dateTime) {
    final date = '${dateTime.hour.asTwoDigitString()}:${dateTime.minute.asTwoDigitString()}';

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

  @override
  String parseToyyMMddHHm(DateTime date) {
    final formatter = DateFormat('y-MM-dd HH:mm');

    return formatter.format(date);
  }

  @override
  FullDateParts getFullDateParts(String date) {
    final dateTime = DateTime.parse(date);

    final day = DateFormat('EEEE').format(dateTime);
    final month = DateFormat('MMMM').format(dateTime);

    return FullDateParts(
      weekDay: day,
      dayOfMonth: dateTime.day.toString().padLeft(2, '0'), // in order to conver '2' to '02'
      month: month,
    );
  }
}
