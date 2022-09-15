// Icons
import 'package:flutter/material.dart';

class IconItems {
  final Icon nullIcon = const Icon(Icons.noise_control_off, size: 1);
  final Icon addIcon = const Icon(Icons.add);
  final Icon settingsIcon = const Icon(Icons.format_list_bulleted_rounded);
  final Icon closeIcon = const Icon(Icons.close);
  final Icon backIcon = const Icon(Icons.arrow_back);
}

class AllColors {
  final Color colorTransparent = Colors.transparent;
  final Color colorBlack = Colors.black;
  final Color colorGrey = Colors.grey;
  final Color colorDarkGrey = const Color.fromARGB(255, 96, 95, 95);
  final Color colorLightGray = const Color.fromARGB(255, 177, 177, 177);
  final Color colordeepPurpleAccent = Colors.deepPurpleAccent;
  final Color colorWhite = Colors.white;
  final Color colorGreen = Colors.green;
  final Color colorRed = Colors.red;
}

class FontSizes {
  final double sizeMin = 14;
  final double sizeNormal = 18;
  final double sizeMax = 24;
  final double sizeMaxX = 28;
  final double sizeMaxXX = 32;
}

class PaddingItems {
  final EdgeInsets paddingZero = EdgeInsets.zero;
  final EdgeInsets paddingTopOnly = EdgeInsets.only(
    top: PaddingValues().paddingNormal,
  );

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
  final EdgeInsets paddingButton = EdgeInsets.symmetric(
    vertical: PaddingValues().paddingSmall,
    horizontal: PaddingValues().paddingNormal,
  );

  final EdgeInsets paddingContentDialog = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingMax,
    vertical: PaddingValues().paddingNormal,
  );

  final EdgeInsets paddingDialogTitle = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingVerySmall,
    vertical: PaddingValues().paddingNormal,
  );

  final EdgeInsets paddingContentTextfield = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingNormal,
    vertical: PaddingValues().paddingSmall * 1.5,
  );
}

class PaddingValues {
  final double paddingVerySmall = 5;
  final double paddingSmall = 10;
  final double paddingNormal = 20;
  final double paddingMax = 30;
  final double paddingMaxX = 45;
  final double paddingMaxXX = 60;
}

class Shapes {
  RoundedRectangleBorder borderDialog = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    side: const BorderSide(
      style: BorderStyle.solid,
      color: Colors.black,
      width: 1,
    ),
  );

  OutlineInputBorder borderTextField = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      gapPadding: 2,
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: Colors.black,
        width: 1,
      ));
}
