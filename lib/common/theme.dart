import 'package:flutter/material.dart';

var theme = ThemeData(
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 58, 58, 58),
      fontWeight: FontWeight.w700,
      fontSize: 24,
      fontFamily: "Roboto"
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 129, 129, 129),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500,
      fontSize: 14
    ),
    titleSmall: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: "Roboto"
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 106, 139, 249),
      disabledBackgroundColor: Color.fromARGB(255, 129, 129, 129),
      disabledForegroundColor: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4))
    )
  )
);