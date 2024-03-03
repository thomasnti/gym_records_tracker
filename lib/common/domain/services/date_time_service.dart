import '../entities/full_date_parts.dart';

abstract class DateTimeService {
  /// Returns a string like 14:43
  String getHourMinuteFromDt(DateTime dateTime);

  /// Returns a string like Aug 10
  String formatToMonthNameDay(DateTime dateTime);

  /// Returns a string in the form of Thu, 10 Aug 2023
  String formatToFullDateWithDayName(DateTime dateTime);

  /// Parse date to '2022-05-16 22:09'
  String parseToyyMMddHHm(DateTime date);

  FullDateParts getFullDateParts(String date);
}
