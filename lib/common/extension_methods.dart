extension StringExtensions on String {
  String capitalizeFirstLetter() {
    final lowerCaseString = toLowerCase();
    return '${lowerCaseString[0].toUpperCase()}${substring(1)}';
  }

  String removeLastCommaFromJson() {
    // ignore: avoid_print
    print('${this[length - 1]} ${this[length - 2]}');
    if (isNotEmpty && this[length - 2] == ',') {
      final lastCommaIndex = lastIndexOf(',');
      final result = substring(0, lastCommaIndex) + substring(lastCommaIndex + 1);
      return result;
    }

    return this;
  }
}

extension TwoDigitExtension on int {
  String asTwoDigitString() => toString().padLeft(2, '0');
}
