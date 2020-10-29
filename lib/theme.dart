import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  // primaryColorDark: const Color(0xFF0097A7),
  // primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: Colors.white,
  accentColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);