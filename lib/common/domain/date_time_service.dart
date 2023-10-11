abstract class DateTimeService {
  /// Returns a string like 14:43
  String getHourMinuteFromDt(DateTime dateTime);

  /// Returns a string like Aug 10
  String formatToMonthNameDay(DateTime dateTime);

  /// Returns a string in the form of Thu, 10 Aug 2023
  String formatToFullDateWithDayName(DateTime dateTime);
}
