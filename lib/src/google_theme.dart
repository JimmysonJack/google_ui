import 'package:flutter/material.dart';

class GoogleTheme {
  const GoogleTheme({
    this.customLightColorScheme,
    this.customDarkColorScheme,
  });

  final ColorScheme? customLightColorScheme;
  final ColorScheme? customDarkColorScheme;

  ThemeData apply({
    bool darkMode = false,
  }) {
    final colorScheme = darkMode
        ? (customDarkColorScheme ?? darkColorScheme)
        : (customLightColorScheme ?? lightColorScheme);

    return ThemeData(
      fontFamily: "Poppins",
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.primary,
      toggleableActiveColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      popupMenuTheme: PopupMenuThemeData(color: colorScheme.surface),
      iconTheme: IconThemeData(color: colorScheme.onBackground),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      textTheme: textTheme.apply(
        displayColor: colorScheme.onBackground,
        bodyColor: colorScheme.background,
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => colorScheme.primary,
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => colorScheme.primaryVariant,
        ),
        elevation: MaterialStateProperty.resolveWith((states) {
          const pressedState = MaterialState.pressed;
          const hoveredState = MaterialState.hovered;
          final isHoveredOrPressed = states
              .where((e) => e == pressedState || e == hoveredState)
              .isNotEmpty;

          if (isHoveredOrPressed) return 3;
          return 0;
        }),
      ),
    );
  }
}

const ColorScheme lightColorScheme = ColorScheme(
  primary: Color(0xFF1A73E9),
  primaryVariant: Color(0xFF1D62D6),
  secondary: Color(0xFF1A73E9),
  secondaryVariant: Color(0xFF1D62D6),
  surface: Colors.white,
  background: Colors.white,
  error: Color(0xFFC6074A),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Color(0xFF3C4043),
  onBackground: Color(0xFF3C4043),
  onError: Colors.white,
  brightness: Brightness.light,
);

const ColorScheme darkColorScheme = ColorScheme(
  primary: Color(0xFF89B4F8),
  primaryVariant: Color(0xFFA6C9FC),
  secondary: Color(0xFF89B4F8),
  secondaryVariant: Color(0xFFA6C9FC),
  surface: Color(0xFF303135),
  background: Color(0xFF202125),
  error: Color(0xFFC6074A),
  onPrimary: Color(0xFF202125),
  onSecondary: Color(0xFF202125),
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);

const textTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 93,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: TextStyle(
    fontSize: 58,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headline4: TextStyle(
    fontSize: 33,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),
  headline6: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
