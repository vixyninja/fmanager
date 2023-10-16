import 'package:flutter/material.dart';
import 'package:fmanager/core/theme/dark_color.dart';
import 'package:fmanager/core/theme/font.dart';
import 'package:fmanager/core/theme/light_color.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: ColorScheme.light(
    background: LightColors.backgroundColor,
    primary: LightColors.primaryColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),
);

final ThemeData themeDataDark = ThemeData(
  useMaterial3: true,
  textTheme: textThemeDark,
  colorScheme: ColorScheme.dark(
    background: DarkColors.backgroundColor,
    primary: DarkColors.primaryColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),
);
