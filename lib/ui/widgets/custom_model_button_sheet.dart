import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheets {
  static String customModalSheetClock(BuildContext context) {
    double bR = 15; // borderRadius
    double elevation = 15;

    void close() {
      Navigator.pop(context);
    }

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(bR))),
        isDismissible: false,
        isScrollControlled: true,
        elevation: elevation,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: CustomIconButton(
                    icon: IconItems().closeIcon,
                    fun: close,
                  ),
                ),
              )
            ],
          );
        });

    return 'x';
  }
}
