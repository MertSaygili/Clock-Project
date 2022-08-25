// Icons
import 'package:flutter/material.dart';

class IconItems {
  final Icon nullIcon = const Icon(Icons.noise_control_off, size: 1);
  final Icon addIcon = Icon(Icons.add, size: FontSizes().sizeMaxXX);
  final Icon settingsIcon =
      Icon(Icons.format_list_bulleted_rounded, size: FontSizes().sizeMaxXX);
}

class FontSizes {
  final double sizeMin = 14;
  final double sizeNormal = 18;
  final double sizeMax = 24;
  final double sizeMaxX = 28;
  final double sizeMaxXX = 32;
}

class PaddignItems {
  final EdgeInsets paddingScreen = EdgeInsets.all(
    PaddingValues().paddingSmall,
  );
  final EdgeInsets paddingCard = EdgeInsets.symmetric(
    vertical: PaddingValues().paddingSmall,
  );
  final EdgeInsets paddingTimer = EdgeInsets.symmetric(
    vertical: PaddingValues().paddingMaxXX,
  );
}

class PaddingValues {
  final double paddingSmall = 10;
  final double paddingNormal = 20;
  final double paddingMaxXX = 60;
}
