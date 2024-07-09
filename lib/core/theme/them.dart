import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmanager/core/theme/dark_color.dart';
import 'package:fmanager/core/theme/font.dart';
import 'package:fmanager/core/theme/light_color.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: const ColorScheme.light(
    background: LightColors.backgroundColor,
    onBackground: LightColors.onBackgroundColor,
    primary: LightColors.primaryColor,
    secondary: LightColors.secondaryColor,
    surface: LightColors.surfaceColor,
    onSurface: LightColors.onSurfaceColor,
    shadow: LightColors.shadowColor,
    tertiary: LightColors.tertiaryColor,
    onTertiary: LightColors.selectedItemColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  useMaterial3: true,
  textTheme: textThemeDark,
  colorScheme: const ColorScheme.dark(
    background: DarkColors.backgroundColor,
    onBackground: DarkColors.onBackgroundColor,
    primary: DarkColors.primaryColor,
    secondary: DarkColors.secondaryColor,
    surface: DarkColors.surfaceColor,
    onSurface: DarkColors.onSurfaceColor,
    shadow: DarkColors.shadowColor,
    tertiary: DarkColors.tertiaryColor,
    onTertiary: DarkColors.selectedItemColor,
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  ),
);
