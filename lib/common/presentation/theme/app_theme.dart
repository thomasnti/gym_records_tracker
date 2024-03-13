import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4CAF50),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.green,
    ),
    useMaterial3: false,
    // Add other color definitions, typography, and configurations for your light theme
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade700,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.amber,
      brightness: Brightness.dark,
    ),
    // Add other color definitions, typography, and configurations for your dark theme
  );
}


/* 
The accentColor in Flutter's ThemeData is a color that represents an accent or complementary color to the primary color. It is often used for highlighting certain elements in your app's user interface to create visual interest and guide the user's attention.

For instance, you might use the accentColor for things like buttons, switches, sliders, and other interactive elements that you want to stand out from the rest of the UI. This color helps create a consistent and visually appealing design by ensuring that all interactive elements share a common color that contrasts well with the primary colors.
*/

/*
In Flutter, you can define a color scheme using the ColorScheme class provided by the framework. This class encapsulates a set of colors that are commonly used in an app's user interface, such as primary, secondary, background, error, and text colors.
 */


// ! Dark theme possible colors
// Deep Blue or Navy (#0D47A1):
// Dark blue provides a strong contrast to warm colors like orange and red. It adds depth and sophistication to your dark theme.
// Charcoal Gray (#333333):
// Gray tones work well in dark themes. Charcoal gray is neutral and pairs nicely with vibrant colors. It won’t overpower your primary colors.
// Dark Teal (#006064):
// Teal is a mix of blue and green. Dark teal adds richness and elegance to your palette. It complements warm tones without being too harsh.
// Burgundy or Maroon (#800000):
// Burgundy or maroon is a deep red-brown color. It harmonizes with your red tones and adds a touch of sophistication.
