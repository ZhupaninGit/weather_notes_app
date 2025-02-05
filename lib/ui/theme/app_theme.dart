import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    textTheme: GoogleFonts.manropeTextTheme(),
    primaryColor: const Color(0xFF415A77),
    scaffoldBackgroundColor: const Color(0xFFE0E1DD),
    colorScheme: const ColorScheme(
      primary: Color(0xFF415A77),
      secondary: Color(0xFF778DA9),
      surface: Color(0xFF1B263B),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurfaceVariant: Colors.black,
      onSurface: Color(0xFF778DA9),
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B263B),
      foregroundColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF778DA9),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
