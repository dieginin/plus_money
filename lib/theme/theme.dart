import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xff00A8CC),
    secondary: const Color(0xff142850),
    // secondary: const Color(0xff0C7B83),
  ),
);
