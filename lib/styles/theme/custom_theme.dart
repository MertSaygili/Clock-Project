import 'package:flutter/material.dart';

import '../../constants/constants.dart';

ThemeData customTheme() {
  final ThemeData theme = ThemeData.light();
  final FontSizes fontSizes = FontSizes();

  return theme.copyWith(
      textTheme: _textTheme(theme.textTheme, fontSizes),
      colorScheme: _colorScheme);
}

TextTheme _textTheme(TextTheme textTheme, FontSizes fontSizes) {
  return textTheme
      .copyWith(
        caption: textTheme.caption?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: fontSizes.sizeMin,
        ),
        button: textTheme.button?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: fontSizes.sizeMin,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
      );
}

const ColorScheme _colorScheme = ColorScheme(
  primary: shrinePink100,
  secondary: shrinePink50,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;
