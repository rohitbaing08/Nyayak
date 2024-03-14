import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';

LightAppColors lightAppColors = LightAppColors();
DarkAppColors darkAppColors = DarkAppColors();

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
      seedColor: lightAppColors.seedColor, brightness: Brightness.light),
  appBarTheme: const AppBarTheme(elevation: 0),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
      seedColor: darkAppColors.seedColor, brightness: Brightness.dark),
  appBarTheme: const AppBarTheme(elevation: 0),
);
