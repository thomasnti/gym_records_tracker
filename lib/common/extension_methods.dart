extension StringExtensions on String {
  String capitalizeFirstLetter() {
    final lowerCaseString = toLowerCase();
    return '${lowerCaseString[0].toUpperCase()}${substring(1)}';
  }
}

extension TwoDigitExtension on int {
  String asTwoDigitString() => toString().padLeft(2, '0');
}
