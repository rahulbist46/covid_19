import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeServices extends Cubit<ThemeMode> {
  ThemeServices() : super(ThemeMode.light);

  static final ThemeServices instance = ThemeServices();

  static final DarkPalette _darkPalette = DarkPalette();
  static final LightPalette _lightPalette = LightPalette();

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPalette.primaryColor,
    scaffoldBackgroundColor: _darkPalette.scaffoldColor,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: ColorPalette.grey.withOpacity(0.4),
      cursorColor: ColorPalette.white,
      selectionHandleColor: ColorPalette.white,
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPalette.primaryColor,
      secondary: _darkPalette.accentColor,
    ),
    textTheme: _textTheme,
  );

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPalette.primaryColor,
    secondaryHeaderColor: _lightPalette.accentColor,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: ColorPalette.black.withOpacity(0.4),
      cursorColor: ColorPalette.white,
      selectionHandleColor: ColorPalette.white,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPalette.primaryColor,
      secondary: _lightPalette.accentColor,
    ),
    textTheme: _textTheme,
  );

  static  const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 33,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    displayMedium: TextStyle(
      fontSize: 30,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    displaySmall: TextStyle(
      fontSize: 27,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    headlineSmall: TextStyle(
      fontSize: 21,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: ColorPalette.black,
      fontFamily: 'DmSans',
    ),
  );

  void changeThemeMode() {
    if (state == ThemeMode.dark) {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.dark);
    }
  }

  bool get isDark => state == ThemeMode.dark;
}

class DarkPalette {
  Color primaryColor = Colors.black;
  Color scaffoldColor = Colors.grey;
  Color accentColor = Colors.white;
}

class LightPalette {
  Color primaryColor = Colors.white;
  Color accentColor = Colors.black;
}

class ColorPalette {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
}
