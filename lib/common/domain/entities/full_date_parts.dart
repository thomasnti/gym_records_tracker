class FullDateParts {
  final String weekDay;
  final String dayOfMonth;
  final String month;

  FullDateParts({
    required this.weekDay,
    required this.dayOfMonth,
    required this.month,
  });

  String get dayShort => weekDay.substring(0, 3);

  String get monthShort => month.substring(0, 3);
}
