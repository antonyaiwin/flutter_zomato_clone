import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();
  static final TextTheme baseTextTheme = GoogleFonts.lexendTextTheme();

  static TextTheme lightTextTheme = baseTextTheme.copyWith(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelLarge: const TextStyle().copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  );

  static TextTheme darkTextTheme = baseTextTheme.copyWith(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
