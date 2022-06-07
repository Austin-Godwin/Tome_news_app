import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TomelNewTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    caption: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    button: GoogleFonts.dmSans(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
    caption: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2A2428),
    ),
    button: GoogleFonts.dmSans(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF2A2428),
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFD32828),
        unselectedItemColor: Color(0xFF2A2428),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFD32828),
        unselectedItemColor: Color(0xFF2A2428),
      ),
      textTheme: darkTextTheme,
    );
  }
}
