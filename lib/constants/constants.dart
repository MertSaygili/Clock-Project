// Icons
import 'package:flutter/material.dart';

class IconItems {
  final Icon nullIcon = const Icon(Icons.noise_control_off, size: 1);
  final Icon addIcon = const Icon(Icons.add);
  final Icon settingsIcon = const Icon(Icons.format_list_bulleted_rounded);
}

class AllColors {
  final Color colorTransparent = Colors.transparent;
  final Color colorBlack = Colors.black;
  final Color colorGrey = Colors.grey;
  final Color colorLightGray = const Color.fromARGB(255, 177, 177, 177);
  final Color colordeepPurpleAccent = Colors.deepPurpleAccent;
  final Color colorWhite = Colors.white;
  final Color colorGreen = Colors.green;
}

class FontSizes {
  final double sizeMin = 14;
  final double sizeNormal = 18;
  final double sizeMax = 24;
  final double sizeMaxX = 28;
  final double sizeMaxXX = 32;
}

class PaddignItems {
  final EdgeInsets paddingCard = EdgeInsets.only(
    top: PaddingValues().paddingSmall,
  );
  final EdgeInsets paddingIconRow = EdgeInsets.only(
    right: PaddingValues().paddingSmall,
  );
  final EdgeInsets paddingInsideCard = EdgeInsets.symmetric(
    vertical: PaddingValues().paddingNormal,
    horizontal: PaddingValues().paddingSmall,
  );
}

class PaddingValues {
  final double paddingSmall = 10;
  final double paddingNormal = 20;
  final double paddingMax = 30;
  final double paddingMaxXX = 60;
}
