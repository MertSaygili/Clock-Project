import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  late final AllColors _colors;

  CustomTheme() {
    _fontSizes = FontSizes();
    _colors = AllColors();
    theme = ThemeData(
      fontFamily: 'RobotoMono',
      textTheme: _textStyles(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: _colors.colordeepPurpleAccent,
          onPrimary: _colors.colorWhite,
          padding: PaddignItems().paddingButton,
          minimumSize: const Size(100, 50),
          maximumSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  TextTheme _textStyles() {
    return TextTheme(
      headline1: TextStyle(
        fontSize: _fontSizes.sizeMaxX,
        fontWeight: FontWeight.w400,
        letterSpacing: -1,
        color: _colors.colorBlack,
      ),
      headline2: TextStyle(
        fontSize: _fontSizes.sizeMax,
        fontWeight: FontWeight.w400,
        letterSpacing: -1,
        color: _colors.colorBlack,
      ),
      headline3: TextStyle(
        fontSize: _fontSizes.sizeNormal,
        fontWeight: FontWeight.w400,
        letterSpacing: -1,
        color: _colors.colorBlack,
      ),
      subtitle1: TextStyle(
        fontSize: _fontSizes.sizeMin,
        fontWeight: FontWeight.w400,
        letterSpacing: -1,
        color: _colors.colorGrey,
      ),
      button: TextStyle(
        fontSize: _fontSizes.sizeNormal,
        fontWeight: FontWeight.w400,
        letterSpacing: -2,
        color: _colors.colorWhite,
      ),
      caption: TextStyle(
        fontSize: _fontSizes.sizeMax,
        fontWeight: FontWeight.w400,
        letterSpacing: -2,
        color: _colors.colordeepPurpleAccent,
      ),
    );
  }
}
