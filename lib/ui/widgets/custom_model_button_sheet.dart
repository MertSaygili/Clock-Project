import 'package:flutter/material.dart';

class CustomModalBottomSheets {
  static String CustomModalSheetClock(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Text('data');
        });

    return 'x';
  }
}
