extension StringExtensions on String {
  String capitalizeFirstLetter() {
    final lowerCaseString = toLowerCase();
    return '${lowerCaseString[0].toUpperCase()}${substring(1)}';
  }
}
