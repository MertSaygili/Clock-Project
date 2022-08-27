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
      headline3: TextStyle(
        fontSize: _fontSizes.sizeNormal,
        fontWeight: FontWeight.w400,
        letterSpacing: -1,
        color: _colors.colorBlack,
      ),
    );
  }
}
