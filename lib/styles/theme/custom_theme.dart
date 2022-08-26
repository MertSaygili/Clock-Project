import 'package:flutter/material.dart';

import '../../constants/constants.dart';

ThemeData customTheme() {
  final ThemeData theme = ThemeData.light();
  final FontSizes fontSizes = FontSizes();

  return theme.copyWith(
    textTheme: _textTheme(theme.textTheme, fontSizes),
    colorScheme: _colorScheme,
  );
}

TextTheme _textTheme(TextTheme textTheme, FontSizes fontSizes) {
  return textTheme
      .copyWith(
        headline1: textTheme.headline1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: fontSizes.sizeMaxXX,
        ),
        headline2: textTheme.headline2?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: fontSizes.sizeMax,
        ),
        headline3: textTheme.headline3?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: fontSizes.sizeNormal,
          letterSpacing: 0,
        ),
        subtitle2: textTheme.subtitle2?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: fontSizes.sizeMin,
          letterSpacing: 0,
        ),
        caption: textTheme.caption?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: fontSizes.sizeNormal,
          letterSpacing: -1,
        ),
        button: textTheme.button?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: fontSizes.sizeNormal,
          letterSpacing: 0,
        ),
      )
      .apply(
        fontFamily: 'RobotoMono',
        displayColor: colorDark900,
        bodyColor: colorGrayLight,
      );
}

const ColorScheme _colorScheme = ColorScheme(
  primary: colorWhite100,
  secondary: colorWhite,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: colorDark900,
  onSecondary: colorDark900,
  onSurface: colorDark900,
  onBackground: colorDark900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color colorWhite = Color.fromARGB(255, 206, 201, 200);
const Color colorWhite100 = Color.fromARGB(255, 224, 224, 224);

const Color colorDark900 = Color.fromARGB(255, 0, 0, 0);
const Color colorDark600 = Color.fromARGB(255, 59, 59, 59);
const Color colorGrayLight = Color.fromARGB(255, 147, 138, 138);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;
