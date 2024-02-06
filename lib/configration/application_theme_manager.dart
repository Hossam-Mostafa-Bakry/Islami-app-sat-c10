import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFFB7935F);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF242424),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF242424),
      selectedIconTheme: IconThemeData(
        size: 32,
        color: Color(0xFF242424),
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color(0xFF242424),
      ),
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(
        size: 26,
        color: Colors.white,
      ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "El Messiri",
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      dividerColor: primaryColor,
      dividerTheme: const DividerThemeData(
        color: primaryColor,
        thickness: 1.5,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "El Messiri",
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xFF242424),
        ),
        bodyLarge: TextStyle(
          fontFamily: "El Messiri",
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Color(0xFF242424),
        ),
        bodyMedium: TextStyle(
          fontFamily: "El Messiri",
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Color(0xFF242424),
        ),
        bodySmall: TextStyle(
          fontFamily: "El Messiri",
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Color(0xFF242424),
        ),
      ));
}
